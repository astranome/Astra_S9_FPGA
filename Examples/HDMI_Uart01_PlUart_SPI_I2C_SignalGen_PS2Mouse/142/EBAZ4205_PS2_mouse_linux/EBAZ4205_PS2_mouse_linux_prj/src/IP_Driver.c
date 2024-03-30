#include "IP_Driver.h"

//#include <iostream.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>


void create_IP_driver(mm_IP * mm_IP_) {

	// open device file for memory access
	mm_IP_->fd = open ("/dev/mem", O_RDWR);
	if (mm_IP_->fd < 1) {
		printf("Could not open /dev/mem\r\n");
		exit(-1);
	}

	// handle page alignment
	int size = mm_IP_->size_in_k * 1024;
	int page_size = sysconf(_SC_PAGESIZE);
	int page_bound_lower = page_size * (mm_IP_->base_address / page_size);  // round down base_adress to next page boundary
	//int page_bound_upper = page_size * (1 + (base_address + size) / page_size); // round up base_adress to next page boundary
	int page_bound_upper = page_size * ( (mm_IP_->base_address + size) / page_size); // round up base_adress to next page boundary
	mm_IP_->page_offset = mm_IP_->base_address % page_size;
	mm_IP_->mem_size = page_bound_upper - page_bound_lower;

	// map memory
	mm_IP_->ptr = mmap(NULL, mm_IP_->mem_size, PROT_READ|PROT_WRITE, MAP_SHARED, mm_IP_->fd, page_bound_lower);
	if (mm_IP_->ptr == MAP_FAILED) {
		printf("Could not map memory at base address %x \r\n", page_bound_lower);
		exit(-1);
	}else
		printf("Mapped memory at base address %x \r\n", page_bound_lower);


	// output mapping report
	/*
	cerr << hex;
	cerr << "memory map information for IP Core @ 0x" << base_address << endl;
	cerr << dec;
	cerr << "page size 	      = " << page_size << endl;
	cerr << hex;
	cerr << "lower page bound      = 0x" << page_bound_lower << endl;
	cerr << "upper page bound      = 0x" << page_bound_upper << endl;
	cerr << dec;
	cerr << "page offset           = " << page_offset << endl;
	cerr << "number of pages       = " << mem_size / page_size << endl;
	cerr << "mapped memory size    = " << mem_size << endl<<endl;
	*/
}

void destroy_IP_driver(mm_IP * _mm_IP) {
	//unmap memory
	if (_mm_IP->ptr != NULL)
		munmap ((void *)_mm_IP->ptr, _mm_IP->mem_size);

	close(_mm_IP->fd);	// close device file
}

void IP_driver_write(mm_IP * _mm_IP, int address, int data) {
	*((int *)((volatile char*)_mm_IP->ptr + _mm_IP->page_offset + address)) = data;
}

int IP_driver_read(mm_IP * _mm_IP, int address) {
	return *(int *)((volatile char*)_mm_IP->ptr + _mm_IP->page_offset + address);
}
