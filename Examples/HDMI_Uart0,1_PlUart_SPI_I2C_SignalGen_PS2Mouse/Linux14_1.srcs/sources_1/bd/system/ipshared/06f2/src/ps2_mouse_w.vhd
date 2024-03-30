--------------------------------------------------------------------------------
--
--   FileName:         ps2_mouse.vhd
--   Dependencies:     ps2_transceiver.vhd, debounce.vhd
--   Design Software:  Quartus II 64-bit Version 13.1.0 Build 162 SJ Web Edition
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 2/16/2018 Scott Larson
--     Initial Public Release
--    
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ps2_mouse_w IS
  GENERIC(
      clk_freq                  : INTEGER := 50_000_000; --system clock frequency in Hz
      ps2_debounce_counter_size : INTEGER := 8);         --set such that 2^size/clk_freq = 5us (size = 8 for 50MHz)
  PORT(
      clk            : IN     STD_LOGIC;                     --system clock input
      reset_n        : IN     STD_LOGIC;                     --active low asynchronous reset
      ps2_clk        : INOUT  STD_LOGIC;                     --clock signal from PS2 mouse
      ps2_data       : INOUT  STD_LOGIC;                     --data signal from PS2 mouse
      mouse_data     : OUT    STD_LOGIC_VECTOR(31 DOWNTO 0); --data received from mouse
      mouse_data_new : OUT    STD_LOGIC;
    
      state_std    : OUT    STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000"; 
      
      ps2_clock_T  : OUT    STD_LOGIC;                     --PS/2 port clock tristate command signal
      ps2_clock_O  : OUT    STD_LOGIC;                     --PS/2 port clock tristate out signal
      ps2_clock_I  : IN     STD_LOGIC;                     --PS/2 port clock tristate in signal
      ps2_dat_T    : OUT    STD_LOGIC;                     --PS/2 port data tristate command signal
      ps2_dat_O    : OUT    STD_LOGIC;                     --PS/2 port data tristate out signal
      ps2_dat_I    : IN     STD_LOGIC                      --PS/2 port data tristate in signal
    
   );                    --new data packet available flag
END ps2_mouse_w;

ARCHITECTURE logic OF ps2_mouse_w IS
  TYPE machine IS(reset, rx_ack1, rx_bat, rx_id, 
                  set_ssr_200, rx_ack3, send_200, rx_ack4,
                  set_ssr_100, rx_ack5, send_100, rx_ack6,
                  set_ssr_80 , rx_ack7, send_80, rx_ack8,
                  send_read_id, rx_ack9, rx_id2,
                  ena_reporting, rx_ack2, stream);  --needed states
  SIGNAL state             : machine := reset;              --state machine  
  SIGNAL tx_ena            : STD_LOGIC := '0';              --transmit enable for ps2_transceiver
  SIGNAL tx_cmd            : STD_LOGIC_VECTOR(8 DOWNTO 0);  --command to transmit
  SIGNAL tx_busy           : STD_LOGIC;                     --ps2_transceiver busy signal
  SIGNAL ps2_code          : STD_LOGIC_VECTOR(7 DOWNTO 0);  --PS/2 code received from ps2_transceiver
  SIGNAL ps2_code_new      : STD_LOGIC;                     --new PS/2 code available flag from ps2_transceiver
  SIGNAL ps2_code_new_prev : STD_LOGIC;                     --previous value of ps2_code_new
  SIGNAL packet_byte       : INTEGER RANGE 0 TO 3 := 3;     --counter to track which packet byte is being received
  SIGNAL mouse_data_int    : STD_LOGIC_VECTOR(31 DOWNTO 0); --internal mouse data register
  SIGNAL ack1_tout_1s      : INTEGER RANGE 0 TO 50000000 := 50000000; -- downcounter to timeout at 1 second the state=ACK1   
  SIGNAL ps2_alt_bit       : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"80000000";     -- to generate always a different word output (to enable the GPIO interrupt"
  
  --component to control PS/2 bus interface to the mouse
  COMPONENT ps2_transceiver IS
    GENERIC(
      clk_freq              : INTEGER;   --system clock frequency in Hz
      debounce_counter_size : INTEGER);  --set such that (2^size)/clk_freq = 5us (size = 8 for 50MHz)
    PORT(
      clk          : IN     STD_LOGIC;                    --system clock
      reset_n      : IN     STD_LOGIC;                    --active low asynchronous reset
      tx_ena       : IN     STD_LOGIC;                    --enable transmit
      tx_cmd       : IN     STD_LOGIC_VECTOR(8 DOWNTO 0); --8-bit command to transmit, MSB is parity bit
      tx_busy      : OUT    STD_LOGIC;                    --indicates transmit in progress
      ack_error    : OUT    STD_LOGIC;                    --device acknowledge from transmit, '1' is error
      ps2_code     : OUT    STD_LOGIC_VECTOR(7 DOWNTO 0); --code received from PS/2 bus
      ps2_code_new : OUT    STD_LOGIC;                    --flag that new PS/2 code is available on ps2_code bus
      rx_error     : OUT    STD_LOGIC;                    --start, stop, or parity receive error detected, '1' is error
      ps2_clk      : INOUT  STD_LOGIC;                    --PS/2 port clock signal
      ps2_data     : INOUT  STD_LOGIC;
      ps2_clock_T  : OUT    STD_LOGIC;                     --PS/2 port clock tristate command signal
      ps2_clock_O  : OUT    STD_LOGIC;                     --PS/2 port clock tristate out signal
      ps2_clock_I  : IN     STD_LOGIC;                     --PS/2 port clock tristate in signal
      ps2_dat_T    : OUT    STD_LOGIC;                     --PS/2 port data tristate command signal
      ps2_dat_O    : OUT    STD_LOGIC;                     --PS/2 port data tristate out signal
      ps2_dat_I    : IN     STD_LOGIC                      --PS/2 port data tristate in signal
    );                   --PS/2 port data signal
  END COMPONENT;

BEGIN

  --PS/2 transceiver to control transactions with mouse
  ps2_transceiver_0:  ps2_transceiver
  GENERIC MAP(clk_freq => clk_freq, debounce_counter_size => ps2_debounce_counter_size)
  PORT MAP(clk => clk, reset_n => reset_n, tx_ena => tx_ena, tx_cmd => tx_cmd, tx_busy => tx_busy, ack_error => OPEN,
        ps2_code => ps2_code, ps2_code_new => ps2_code_new, rx_error => OPEN, ps2_clk => ps2_clk, ps2_data => ps2_data,
        ps2_dat_I => ps2_dat_I, ps2_dat_T => ps2_dat_T, ps2_dat_O => ps2_dat_O, 
        ps2_clock_I => ps2_clock_I, ps2_clock_T => ps2_clock_T, ps2_clock_O => ps2_clock_O 
        
        );

  PROCESS(clk, reset_n)
  BEGIN
    IF(reset_n = '0') THEN              --asynchronous reset
      mouse_data_new <= '0';              --clear new mouse data available flag
      mouse_data <= (OTHERS => '0');      --clear last mouse data packet received
      state <= reset;                     --set state machine to reset the mouse
      state_std <= x"00000000";  
    ELSIF(clk'EVENT AND clk = '1') THEN
      ps2_code_new_prev <= ps2_code_new;  --store previous value of the new PS/2 code flag

      CASE state IS

        WHEN reset =>
          IF(tx_busy = '0') THEN        --transmit to mouse not yet in process
            tx_ena <= '1';                --enable transmit to PS/2 mouse
            tx_cmd <= "111111111";        --send reset command (0xFF)
            state <= reset;
            state_std <= x"00000000";            --remain in reset state
          ELSIF(tx_busy = '1') THEN     --transmit to mouse is in process
            tx_ena <= '0';                --clear transmit enable
            state <= rx_ack1;             --wait to receive an acknowledge from mouse
            state_std <= x"00000001";  
            ack1_tout_1s <= 50000000; 
  
          END IF;
        
        WHEN rx_ack1 =>
          IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN --new PS/2 code received
            IF(ps2_code = "11111010") THEN                          --new PS/2 code is acknowledge (0xFA)
              state <= rx_bat;                                        --wait to receive new BAT completion code
              state_std <= x"00000002";  
            ELSE                                                    --new PS/2 code was not an acknowledge
              state <= reset;
              state_std <= x"00000000";                             --reset mouse again
            END IF;
          ELSE                                                    --new PS/2 code not yet received
            IF(ack1_tout_1s = 0) THEN
              state <= reset;                                     -- if no ack is received in 1 second, reset! 
              state_std <= x"00000000";  
            ELSE
              ack1_tout_1s <= ack1_tout_1s - 1;                      -- decrease the 1 second counter  
              state <= rx_ack1;                                      -- wait to receive a code from mouse
              state_std <= x"00000001"; 
            END IF;
            
          END IF;
        
        WHEN rx_bat =>          
          IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN --new PS/2 code received
            IF(ps2_code = "10101010") THEN                          --new PS/2 code is BAT completion (0xAA)
              state <= rx_id;                                         --wait to receive device ID code
              state_std <= x"00000003";  
           ELSE                                                    --new PS/2 code was not BAT completion
              state <= reset;                                         --reset mouse again
              state_std <= x"00000000";  
  
           END IF;
          ELSE                                                    --new PS/2 code not yet received
            state <= rx_bat;                                        --wait to receive a code from mouse
            state_std <= x"00000002";  
  
          END IF;
        
        WHEN rx_id =>
          IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN --new PS/2 code received
            IF(ps2_code = "00000000") THEN                          --new PS/2 code is a mouse device ID (0x00)
              state <= set_ssr_200;                                 --send command to set SSR 
              state_std <= x"00000004";  
  
            ELSE                                                    --new PS/2 code is not a mouse device ID
              state <= reset;                                         --reset mouse again
              state_std <= x"00000000";  
  
            END IF;
          ELSE                                                    --new PS/2 code not yet received
            --GG state <= rx_id;                                         --wait to receive a code from mouse
            state <= rx_id;                                         --wait to receive a code from mouse
            state_std <= x"00000003";  
  
          END IF;
        ----- End traditional PS/2 mouse
        ----- Start PS/2 Intellimouse probing
       WHEN set_ssr_200 =>
          IF(tx_busy = '0') THEN        --transmit to mouse not yet in process
            tx_ena <= '1';                --enable transmit to PS/2 mouse
            tx_cmd <= "111110011";        --send Set Sampling Rate command (0xF3) MSB is parity 1
            state <= set_ssr_200;               --remain in set_ssr_200 state
            state_std <= x"00000004";  
  
          ELSIF(tx_busy = '1') THEN     --transmit to mouse is in process
            tx_ena <= '0';                --clear transmit enable
            state <= rx_ack3;             --wait to receive an acknowledge from mouse
            state_std <= x"00000005";  
  
          END IF;
          
        WHEN rx_ack3 =>
          IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN --new PS/2 code received
            IF(ps2_code = "11111010") THEN                          --new PS/2 code is acknowledge (0xFA)
              state <= send_200;                                -- going to send 200
              state_std <= x"00000006";  
  
            ELSE                                                    --new PS/2 code was not an acknowledge
              state <= reset;                                         --reset mouse again
              state_std <= x"00000000";  
  
            END IF;
          ELSE                                                    --new PS/2 code not yet received
            state <= rx_ack3;                                       --wait to receive a code from mouse
            state_std <= x"00000005";  
  
          END IF;
        
       WHEN send_200 =>
          IF(tx_busy = '0') THEN        --transmit to mouse not yet in process
            tx_ena <= '1';               --enable transmit to PS/2 mouse
            tx_cmd <= "011001000";       --send 200 (0xC8) parity 0
            state <= send_200;           -- wait for end of trasmission to mouse
            state_std <= x"00000006";  
  
          ELSIF(tx_busy = '1') THEN      --transmit to mouse is in process
            tx_ena <= '0';               --clear transmit enable
            state <= rx_ack4;           --going to wait for ACK 
            state_std <= x"00000007";  
  
          END IF;
       
        WHEN rx_ack4 =>
          IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN --new PS/2 code received
            IF(ps2_code = "11111010") THEN                          --new PS/2 code is acknowledge (0xFA)
              state <= set_ssr_100;                                    -- going to send SSR 100
              state_std <= x"00000008";  
  
            ELSE                                                    --new PS/2 code was not an acknowledge
              state <= reset;                                         --reset mouse again
              state_std <= x"00000000";  
  
            END IF;
          ELSE                                                    --new PS/2 code not yet received
            state <= rx_ack4;                                       --wait to receive a code from mouse
            state_std <= x"00000007";  
  
          END IF;
       
       WHEN set_ssr_100 =>
          IF(tx_busy = '0') THEN        --transmit to mouse not yet in process
            tx_ena <= '1';                --enable transmit to PS/2 mouse
            tx_cmd <= "111110011";        --send Set Sampling Rate command (0xF3) parity 1
            state <= set_ssr_100;               --remain in set_ssr_100 state
            state_std <= x"00000008";  
  
          ELSIF(tx_busy = '1') THEN     --transmit to mouse is in process
            tx_ena <= '0';                --clear transmit enable
            state <= rx_ack5;             --wait to receive an acknowledge from mouse
            state_std <= x"00000009";  
  
          END IF;
        
        WHEN rx_ack5 =>
          IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN --new PS/2 code received
            IF(ps2_code = "11111010") THEN                          --new PS/2 code is acknowledge (0xFA)
              state <= send_100;                                -- going to send 100
              state_std <= x"0000000A";  
  
            ELSE                                                    --new PS/2 code was not an acknowledge
              state <= reset;                                         --reset mouse again
              state_std <= x"00000000";  
  
            END IF;
          ELSE                                                    --new PS/2 code not yet received
            state <= rx_ack5;                                       --wait to receive a code from mouse
            state_std <= x"00000009";  
  
          END IF;
       
       WHEN send_100 =>
          IF(tx_busy = '0') THEN        --transmit to mouse not yet in process
            tx_ena <= '1';               --enable transmit to PS/2 mouse
            tx_cmd <= "001100100";       --send 100 (0x64) parity 0 
            state <= send_100;           -- wait for end of trasmission to mouse
            state_std <= x"0000000A";  
  
          ELSIF(tx_busy = '1') THEN      --transmit to mouse is in process
            tx_ena <= '0';               --clear transmit enable
            state <= rx_ack6;           --going to wait for ACK 
            state_std <= x"0000000B";  
  
          END IF;
        
        WHEN rx_ack6 =>
          IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN --new PS/2 code received
            IF(ps2_code = "11111010") THEN                          --new PS/2 code is acknowledge (0xFA)
              state <= set_ssr_80;                                    -- going to send SSR 80
              state_std <= x"0000000C";  
  
            ELSE                                                    --new PS/2 code was not an acknowledge
              state <= reset;                                         --reset mouse again
              state_std <= x"00000000";  
  
            END IF;
          ELSE                                                    --new PS/2 code not yet received
            state <= rx_ack6;                                       --wait to receive a code from mouse
            state_std <= x"0000000B";  
  
          END IF;
         
       WHEN set_ssr_80 =>
          IF(tx_busy = '0') THEN        --transmit to mouse not yet in process
            tx_ena <= '1';                --enable transmit to PS/2 mouse
            tx_cmd <= "111110011";        --send Set Sampling Rate command (0xF3) parity 1
            state <= set_ssr_80;          --remain in set_ssr_100 state
            state_std <= x"0000000C";  
  
          ELSIF(tx_busy = '1') THEN     --transmit to mouse is in process
            tx_ena <= '0';                --clear transmit enable
            state <= rx_ack7;             --wait to receive an acknowledge from mouse
            state_std <= x"0000000D";  
  
          END IF;
       
        WHEN rx_ack7 =>
          IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN --new PS/2 code received
            IF(ps2_code = "11111010") THEN                          --new PS/2 code is acknowledge (0xFA)
              state <= send_80;                                -- going to send 100
              state_std <= x"0000000E";  
  
            ELSE                                                    --new PS/2 code was not an acknowledge
              state <= reset;                                         --reset mouse again
              state_std <= x"00000000";  
  
            END IF;
          ELSE                                                    --new PS/2 code not yet received
            state <= rx_ack7;                                       --wait to receive a code from mouse
            state_std <= x"0000000D";  
  
          END IF;
       
       WHEN send_80 =>
          IF(tx_busy = '0') THEN        --transmit to mouse not yet in process
            tx_ena <= '1';               --enable transmit to PS/2 mouse
            tx_cmd <= "101010000";       --send 80 (0x50) parity 1
            state <= send_80;           -- wait for end of trasmission to mouse
            state_std <= x"0000000E";  
  
          ELSIF(tx_busy = '1') THEN      --transmit to mouse is in process
            tx_ena <= '0';               --clear transmit enable
            state <= rx_ack8;           --going to wait for ACK 
            state_std <= x"0000000F";  
  
          END IF;
        
        WHEN rx_ack8 =>
          IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN --new PS/2 code received
            IF(ps2_code = "11111010") THEN                        --new PS/2 code is acknowledge (0xFA)
              state <= send_read_id;                              -- going to send Read Device ID 
              state_std <= x"00000010";  
  
            ELSE                                                  --new PS/2 code was not an acknowledge
              state <= reset;                                     --reset mouse again
              state_std <= x"00000000";  
  
            END IF;
          ELSE                                                    --new PS/2 code not yet received
            state <= rx_ack8;                                     --wait to receive a code from mouse
            state_std <= x"0000000F";  
  
          END IF;
        
       WHEN send_read_id =>
          IF(tx_busy = '0') THEN        --transmit to mouse not yet in process
            tx_ena <= '1';               --enable transmit to PS/2 mouse
            tx_cmd <= "011110010";       --send 0xF2 parity 0
            state <= send_read_id;        -- wait for end of trasmission to mouse
            state_std <= x"00000010";  
  
          ELSIF(tx_busy = '1') THEN      --transmit to mouse is in process
            tx_ena <= '0';               --clear transmit enable
            state <= rx_ack9;           --going to wait for ACK 
            state_std <= x"00000011";  
  
          END IF;
        
        WHEN rx_ack9 =>
          IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN --new PS/2 code received
            IF(ps2_code = "11111010") THEN                        --new PS/2 code is acknowledge (0xFA)
              state <= rx_id2;                                    -- going to read the Device ID 
              state_std <= x"00000012";  
  
            ELSE                                                  --new PS/2 code was not an acknowledge
              state <= reset;                                     --reset mouse again
              state_std <= x"00000000";  
  
            END IF;
          ELSE                                                    --new PS/2 code not yet received
            state <= rx_ack9;                                     --wait to receive a code from mouse
            state_std <= x"00000011";  
  
          END IF;
        
        WHEN rx_id2 =>
          IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN --new PS/2 code received
            IF(ps2_code = "00000000" OR ps2_code = "00000011") THEN--new PS/2 code is a mouse device ID (0x00 or 0x03)
              state <= ena_reporting;                                 --send command to enable data reporting
              state_std <= x"00000013";  
  
            ELSE                                                    --new PS/2 code is not a mouse device ID
              state <= reset;                                         --reset mouse again
              state_std <= x"00000000";  
  
            END IF;
          ELSE                                                    --new PS/2 code not yet received
            state <= rx_id2;                                         --wait to receive a code from mouse
            state_std <= x"00000012";  
  
          END IF;
        
        ----- End  PS/2 Intellimouse
       WHEN ena_reporting =>
          IF(tx_busy = '0') THEN     --transmit to mouse not yet in process
            tx_ena <= '1';             --enable transmit to PS/2 mouse
            tx_cmd <= "011110100";     --send enable reporting command (0xF4)
            state <= ena_reporting;    --remain in ena_reporting state
            state_std <= x"00000013";  
  
          ELSIF(tx_busy = '1') THEN  --transmit to mouse is in process
            tx_ena <= '0';             --clear transmit enable
            state <= rx_ack2;          --wait to receive an acknowledge from mouse
            state_std <= x"00000014";  
  
          END IF;
        
        WHEN rx_ack2 =>
          IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN   --new PS/2 code received
            IF(ps2_code = "11111010") THEN                          --new PS/2 code is acknowledge (0xFA)
              state <= stream;                                      --proceed to collect and output data from mouse
              state_std <= x"00000015";  
  
            ELSE                                                    --new PS/2 code was not an acknowledge
              state <= reset;                                       --reset mouse again
              state_std <= x"00000000";  
  
            END IF;
          ELSE                                                      --new PS/2 code not yet received
            state <= rx_ack2;                                       --wait to receive a code from mouse
            state_std <= x"00000014";  
  
          END IF;
        
        WHEN stream =>
          IF(ps2_code_new_prev = '0' AND ps2_code_new = '1') THEN                     --new PS/2 code received
            mouse_data_new <= '0';                                                      --clear new data packet available flag
            mouse_data_int(7+packet_byte*8 DOWNTO packet_byte*8) <= ps2_code;           --store new mouse data byte
            IF(packet_byte = 0) THEN                                                    --all bytes in packet received and presented
              packet_byte <= 3;                                                           --clear packet byte counter
              ps2_alt_bit <= ps2_alt_bit xor x"80000000";                                -- alternate 0x80000000 and 0x00000000
            ELSE                                                                        --not all bytes in packet received yet
              packet_byte <= packet_byte - 1;                                             --increment packet byte counter
            END IF;
          END IF;
          
          IF(ps2_code_new_prev = '1' AND ps2_code_new = '1' AND packet_byte = 3) THEN --mouse data receive is complete
            mouse_data <= ps2_alt_bit or (mouse_data_int and x"7FFFFFFF") ;           --present new mouse data at output
            mouse_data_new <= '1';                                                    --set new data packet available flag
          END IF;
          
      END CASE;    
    END IF;  
  END PROCESS;      
        
END logic;


