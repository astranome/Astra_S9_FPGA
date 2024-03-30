################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/IP_Driver.c \
../src/demo_polling.c \
../src/demo_uio.c \
../src/mouse_emu.c \
../src/xgpio_sinit.c 

OBJS += \
./src/IP_Driver.o \
./src/demo_polling.o \
./src/demo_uio.o \
./src/mouse_emu.o \
./src/xgpio_sinit.o 

C_DEPS += \
./src/IP_Driver.d \
./src/demo_polling.d \
./src/demo_uio.d \
./src/mouse_emu.d \
./src/xgpio_sinit.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 Linux gcc compiler'
	arm-linux-gnueabihf-gcc -Wall -O2 -c -fmessage-length=0 -MT"$@" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


