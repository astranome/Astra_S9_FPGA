################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/src/IP_Driver.c \
../src/src/demo_polling.c \
../src/src/demo_uio.c \
../src/src/mouse_emu.c \
../src/src/xgpio_sinit.c 

OBJS += \
./src/src/IP_Driver.o \
./src/src/demo_polling.o \
./src/src/demo_uio.o \
./src/src/mouse_emu.o \
./src/src/xgpio_sinit.o 

C_DEPS += \
./src/src/IP_Driver.d \
./src/src/demo_polling.d \
./src/src/demo_uio.d \
./src/src/mouse_emu.d \
./src/src/xgpio_sinit.d 


# Each subdirectory must supply rules for building sources it contributes
src/src/%.o: ../src/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I"E:\Linux14_1\142\system_wrapper_hw_platform_0" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../FSBL_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


