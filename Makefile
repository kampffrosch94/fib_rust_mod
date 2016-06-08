TARGET = fib_kernel_mod

ifneq ($(KERNELRELEASE),)
# call from kernel build system

obj-m	+= $(TARGET).o
fib_kernel_mod-objs := module.o fibrust.o
#fib_kernel_mod-objs := module.o try1.o

else

KERNELDIR ?= /usr/src/linux
PWD       := $(shell pwd)

default: 
	rm -f fibrust.o_shipped fibrust/fibrust.o_shipped
	cd fibrust && $(MAKE)
	cp fibrust/fibrust.o_shipped ./
	$(MAKE) -C $(KERNELDIR) M=$(shell pwd) modules

endif

clean:
	rm -rf *.o *.ko *~ core .depend *.mod.c .*.cmd .tmp_versions .*.o.d

depend .depend dep:
	$(CC) $(CFLAGS) -M *.c > .depend

ins: default rem
	insmod $(TARGET).ko
rem:
	@if [ -n "`lsmod | grep -s $(TARGET)`" ]; then rmmod $(TARGET); echo "rmmod $(TARGET)"; fi

dump:
	objdump -dr $(TARGET).ko

ifeq (.depend,$(wildcard .depend))
include .depend
endif
