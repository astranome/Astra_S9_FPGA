# Astra_S9_FPGA
Astra_S9_FPGA is a FPGA-SoC Development Board from used Antminer S9 Control Board.
This board WAS NOT DESIGNED as a motherboard with the ability to connect anything other than hashboards. It has no video output,USB,SPI, I2S, or audio. It is an industrial equipment for one specific task, made to high standards of reliability and durability.

But there is a great advantage over other platforms such as Raspberry, Orange, Banana, BeagleBoard. This is the ZYNQ 7000, that is, in addition to the SoC (microprocessor), there is an FPGA in the chip, which can be implemented (synthesized) in hardware, rather than emulated, for example, a pair of microcontrollers, a video card, video and audio codecs, USB, a dozen comports, Crypto cores, scalers, media converters, frequency synthesizers and much more.

But there are some limitations. For example, only DDR3 memory is supported, with a capacity of up to 1000MB. And the frequency of both CORTEX A9 processor cores is much less than 1000 MHz.
![astra_S9](https://github.com/astranome/Astra_S9_FPGA/assets/36866164/6c7fab8c-ea6c-4d7e-a985-55440a636fb7)
![ubun](https://github.com/astranome/Astra_S9_FPGA/assets/36866164/6ee16010-37d4-4a46-909a-a471a75b5c6d)

This project shows how to add I2c, SPI, second UART, PS/2 mouse (not finished yet), generator signal output up to 100 MHz, and, of course, HDMI is implemented. Now this board allows you to view images, PDF too. It is possible to watch videos, for example mp4, pre-downloaded from YouTube. The sound has not yet been implemented, if you start streaming video from YouTube in the browser, then playback is in slideshow mode. Therefore, a better use will be found for this board than running Chrome. For example, let's display the exchange rate chart of Bitcoin, the weather and the news feed.
And yes! It was possible to run X11, in other words, Linux Desktop LXDE. ![image](https://github.com/astranome/Astra_S9_FPGA/assets/36866164/91c914cd-c0fc-48e8-a8b9-fc15f9d22afc)

To run UBUNTU on this board, you need to prepare an SD card. You need to create two disk partitions, FAT32 and Ext4. In the FAT section, you need to copy the files from the BOOT directory.
You need to copy the rootfs image to the EXT4 partition. ROOTFS has a size of more than 4 Gb. It is unlikely that Github allows you to download such large files, so I hope a free file storage will help me.

What has been achieved?
What was done with the C41 card? The story lasts for a couple of years:
--2001--2023——

An example for this board was found on github, https://github.com/KarolNi/S9miner_sample The first project has been assembled - LED flashing.
Successful launch of Ubuntu and Petalinux
Our own U-Boot has been successfully built, thanks to the excellent tutorial from Andrey https://habr.com/ru/articles/565368/
---=== It became clear that you can do without a programmer ===---
We managed to revive the board from the Antbuild (thanks a lot @Tankonaft)
Test applications have been launched — pattern generators —HDMI and VGA monitors display images
<img width="900" height="675" alt="image" src="https://github.com/user-attachments/assets/9d9575a8-52d7-4f50-8daf-ca0ec131d3fa" />


———-2024——-

PYNQ—Ubuntu successfully displays the console, MS, pictures and video clips on the HDMI monitor
<img width="900" height="506" alt="image" src="https://github.com/user-attachments/assets/f51d1b0a-c897-4a23-bd87-c8fde08c66dc" />

<img width="1280" height="960" alt="image" src="https://github.com/user-attachments/assets/8178aa6c-72a5-496f-a6d3-524a85726c98" />


Lubuntu-desktop is running
<img width="900" height="675" alt="image" src="https://github.com/user-attachments/assets/66cb8cea-02c7-4ec4-8309-7676e1b11594" />


A USB Host is implemented (this pleasure is several times higher than the cost of the board)
<img width="900" height="477" alt="image" src="https://github.com/user-attachments/assets/8c42068b-ecf1-4279-9612-6a67f94d3e6c" />


The work with GPIO is mastered, the ILI 9325 screen is connected via the 8bit bus
<img width="900" height="532" alt="image" src="https://github.com/user-attachments/assets/f48ff7ce-08c6-4d51-93c7-6d8d4fe70fe2" />

this SMALL screen is difficult to connect
<img width="900" height="675" alt="image" src="https://github.com/user-attachments/assets/05b3b323-6dcd-4f14-bdd1-9bed77cb10b4" />

I2C has been mastered and the LCD2004 SMBUS display is connected
<img width="900" height="506" alt="image" src="https://github.com/user-attachments/assets/5b9057af-7f7c-467c-9876-e11571f79a9c" />

SPI interface - 9341 and 7735 TFT displays are connected
<img width="900" height="675" alt="image" src="https://github.com/user-attachments/assets/d87a847f-7939-455c-95cd-098b33604b99" />
<img width="900" height="675" alt="image" src="https://github.com/user-attachments/assets/c67fff85-9cc2-4650-a434-48223196c63c" />
<img width="900" height="416" alt="image" src="https://github.com/user-attachments/assets/519415de-31a5-4cd9-a467-0ca77f2967dc" />

The converter is made - USB keyboard-UART
<img width="900" height="675" alt="image" src="https://github.com/user-attachments/assets/45cf6474-43da-4808-b8b7-7607fcfd0abd" />

Implemented access to the NAND (MTD) when booting from the SD

I2S implementation — audio is played, while HDMI does not work due to the proprietary HDMI core.
(VGA works without problems.) 

The web radio is working, the ZynAddSubFX Yoshimi midi synthesizer, the FluidSynth midi player and the RoseGarden sound studio are implemented
<img width="506" height="900" alt="image" src="https://github.com/user-attachments/assets/0da6b966-2b85-4399-897b-d242fe989fa1" />
<img width="972" height="666" alt="image" src="https://github.com/user-attachments/assets/8432c6b0-a46d-4b7d-bc8b-f65fe3d8c993" />
<img width="1590" height="892" alt="image" src="https://github.com/user-attachments/assets/dde7e80e-2965-4d9d-b07c-376b71ef88b1" />

the microphone is working
<img width="458" height="436" alt="image" src="https://github.com/user-attachments/assets/004df89d-67cd-46b3-beaa-178337fcf98a" />

, STT TTS speech recognition and synthesis are running, and as a result, the Offline Voice Assistant Irina
<img width="900" height="675" alt="image" src="https://github.com/user-attachments/assets/c98ae04f-0b19-4a2a-8ac8-5fa79c8571d9" />

VGA1bit
<img width="900" height="506" alt="image" src="https://github.com/user-attachments/assets/4b28ca59-5611-46b8-8389-ec31150ae5c6" />
<img width="720" height="1280" alt="image" src="https://github.com/user-attachments/assets/a164c852-3cb9-4bbe-8451-52978921dd1a" />

VGA runs on a standard core, now audio and video are played at the same time. The disadvantage is that the CA requires a lot - 14 pins for 4bit per color mode, while the picture quality is tolerable, not ideal, to improve the color space, you will need to use 12 more pins = 26 (and 52 resistors), there are very few free pins left.

-------------- Valid links --------------
---------------------------------------------------------------------------------------------
There is a very similar board - Antminer T9+
<img width="756" height="565" alt="image" src="https://github.com/user-attachments/assets/0d75543a-fa79-4c37-9165-8bac0d591f53" />

https://github.com/opensatellite/antminer_t9/tree/master
