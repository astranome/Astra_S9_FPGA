# Astra_S9_FPGA
Astra_S9_FPGA is a FPGA-SoC Development Board from used Antminer S9 Control Board.
It is a Powerful FPGA/SoC Development Board made from a repurposed Antminer S9 Control Board.(Also works on T9+ Control Boards) It provide a cheap, powerful, efficient and versatile development environment for low-cost and is the perfect way of getting into FPGA for beginners.

I got the idea to tranform miner control board into valuable development platform a couple years ago but it stayed in the idea state for a while because i was lacking the time , but i finaly got myself time to make development more accessible for lot of hobyist that dont have the money nor want to spend hundreds and thousands of dollars to only be able to get an FPGA Board. With the price of the commercialy avaible boards like the Alinx or the Pynq platforms already high and increasing every day, and the shortage of chips and suplly chains made this project even more relevant and repurposing existing and cheap board into something comparable to those commercial paltform almost became a need.
![astra_S9](https://github.com/astranome/Astra_S9_FPGA/assets/36866164/6c7fab8c-ea6c-4d7e-a985-55440a636fb7)
![ubun](https://github.com/astranome/Astra_S9_FPGA/assets/36866164/6ee16010-37d4-4a46-909a-a471a75b5c6d)

This project shows how to add I2c, SPI, second UART, PS/2 mouse (not finished yet), generator signal output up to 100 MHz, and, of course, HDMI is implemented. Now this board allows you to view images, PDF too. It is possible to watch videos, for example mp4, pre-downloaded from YouTube. The sound has not yet been implemented, if you start streaming video from YouTube in the browser, then playback is in slideshow mode. Therefore, a better use will be found for this board than running Chrome. For example, let's display the exchange rate chart of Bitcoin, the weather and the news feed.
And yes! It was possible to run X11, in other words, Linux Desktop LXDE. ![image](https://github.com/astranome/Astra_S9_FPGA/assets/36866164/91c914cd-c0fc-48e8-a8b9-fc15f9d22afc)

To run UBUNTU on this board, you need to prepare an SD card. You need to create two disk partitions, FAT32 and Ext4. In the FAT section, you need to copy the files from the BOOT directory.
You need to copy the rootfs image to the EXT4 partition. ROOTFS has a size of more than 4 Gb. It is unlikely that Github allows you to download such large files, so I hope a free file storage will help me.
