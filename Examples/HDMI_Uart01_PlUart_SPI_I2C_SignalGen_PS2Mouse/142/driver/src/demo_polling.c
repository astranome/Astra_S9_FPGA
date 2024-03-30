
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include "xil_types.h"
#include "xgpio.h"
#include "IP_Driver.h"
#include "xparameters.h"
#include "xparameters_ps.h"

typedef struct PS2_data_type {
	int Yoverflow; int Xoverflow;
	int Ysign; int Xsign;
	int MiddleBtn; int RightBtn; int LeftBtn;
	int Xmovement; int Ymovement; int FourthBtn;
	int FifthBtn; int Zmovement;
}PS2_data;

PS2_data PS2Data;
XGpio Gpio; /* The Instance of the GPIO Driver */

#define GPIO_DEVICE_ID		XPAR_GPIO_0_DEVICE_ID
#define xil_printf printf


int decodePS2(u32 ps2_bytes, PS2_data *PS2Data){

	short mys;

	// First Byte
	PS2Data->Yoverflow = (ps2_bytes >> 31)  & 0x01;
	PS2Data->Xoverflow = (ps2_bytes >> 30)  & 0x01;
	PS2Data->Ysign =     (ps2_bytes >> 29)  & 0x01;
	PS2Data->Xsign =     (ps2_bytes >> 28)  & 0x01;
	PS2Data->MiddleBtn = (ps2_bytes >> 26)  & 0x01;
	PS2Data->RightBtn =  (ps2_bytes >> 25)  & 0x01;
	PS2Data->LeftBtn =   (ps2_bytes >> 24)  & 0x01;

	mys =   ((ps2_bytes >> 16) & 0xFF);
	PS2Data->Xmovement =   mys | (PS2Data->Xsign * 0xFFFFFF00);
	mys =   ((ps2_bytes >> 8) & 0xFF);
	PS2Data->Ymovement =  mys  | (PS2Data->Ysign * 0xFFFFFF00);
	mys =  (char) ((ps2_bytes     ) & 0xFF);
	PS2Data->Zmovement =  mys |  ((mys>>7)       * 0xFFFFFF00);

	return 0;
}



/******************************************************************************/
/**
*
* This is the entry function from the TestAppGen tool generated application
* which polls the the GPIO
*
* @param	InstancePtr is a reference to the GPIO driver Instance
* @param	DeviceId is the XPAR_<GPIO_instance>_DEVICE_ID value from
*		xparameters.h
* @param	DataRead is the pointer where the data read from GPIO Input is
*		returned
*
* @return
*		- XST_SUCCESS if the Test is successful
*		- XST_FAILURE if the test is not successful
*
* @note		None.
*
******************************************************************************/
int GpioPollingExample(XGpio* InstancePtr, u16 DeviceId)
{
	int Status;
	u32 delay_count;

	mm_IP gpio_mm_IP; // memory mapped GPIO IP
	gpio_mm_IP.base_address = XPAR_AXI_GPIO_0_BASEADDR;
	gpio_mm_IP.size_in_k = 64;
	create_IP_driver(&gpio_mm_IP);

	/* Initialize the GPIO driver. If an error occurs then exit */
	/*
	Status = XGpio_Initialize(InstancePtr, DeviceId);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	*/
	/*
	Status = GpioSetupIntrSystem(IntcInstancePtr, InstancePtr, DeviceId,
					IntrId, IntrMask);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	IntrFlag = 0;
	*/
	u32 prev_gpio_status = 0;
	unsigned long last_poll = 0;
	unsigned long now_usecs;
	while(1) {
		// poll the port every msecs
		now_usecs = clock();
		if( now_usecs + 10000L > last_poll){   // 10 milliseconds
			// now read the GPIO (32 bits) from Channel 1
			//u32 gpio_status = gpio_mm_IP. XGpio_DiscreteRead(&Gpio,1);
			u32 gpio_status = IP_driver_read(&gpio_mm_IP, 0); // read at base_address
			if(gpio_status != prev_gpio_status){

				decodePS2(gpio_status, &PS2Data);
				xil_printf("now(usecs)=%lu LeftBtn=%d MiddleBtn=%d RightBtn=%d Xsign=%d Ysign=%d Xoverflow=%d Yoverflow=%d X=%d Y=%d Z=%d\r\n",
							now_usecs,
							PS2Data.LeftBtn,PS2Data.MiddleBtn,PS2Data.RightBtn,
							PS2Data.Xsign, PS2Data.Ysign,
							PS2Data.Xoverflow, PS2Data.Yoverflow,
							PS2Data.Xmovement, PS2Data.Ymovement,PS2Data.Zmovement
				);
				prev_gpio_status = gpio_status;
			}
			last_poll = now_usecs;
		}

	}

	//GpioDisableIntr(IntcInstancePtr, InstancePtr, IntrId, IntrMask);

	//*DataRead = IntrFlag;

	return Status;
}


/****************************************************************************/
/**
* This function is the main function of the GPIO example.  It is responsible
* for initializing the GPIO device, setting up interrupts and providing a
* foreground loop such that interrupt can occur in the background.
*
*
* @return
*		- XST_SUCCESS to indicate success.
*		- XST_FAILURE to indicate failure.
*
* @note		None.
*
*****************************************************************************/
int maino(void)
{
	int Status;
	u32 DataRead;

	  printf(" Press button to Generate Interrupt\r\n");


	  /*
	  Status = GpioIntrExample(&Intc, &Gpio,
				   GPIO_DEVICE_ID,
				   INTC_GPIO_INTERRUPT_ID,
				   GPIO_CHANNEL1, &DataRead);
      */
	  Status = GpioPollingExample(&Gpio,
	  				   GPIO_DEVICE_ID
	  				   );


	if (Status == 0 ){
		if(DataRead == 0)
			printf("No button pressed. \r\n");
		else
			printf("Successfully ran Gpio Interrupt Tapp Example\r\n");
	} else {
		 printf("Gpio Interrupt Tapp Example Failed.\r\n");
		 return -1;
	}

	return 0;
}


