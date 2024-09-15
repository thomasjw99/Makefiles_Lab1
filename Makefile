CPP=$(PICO_TOOLCHAIN_PATH)/arm-none-eabi-cpp
CC=$(PICO_TOOLCHAIN_PATH)/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/arm-none-eabi-as
LD=$(PICO_TOOLCHAIN_PATH)/arm-none-eabi-ld
OBJCOPY=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-objcopy

SRC=main.c second.c
OBJS=$(patsubst %.c,%.o,$(SRC))

all: firmware.elf

clean:
	rm -f *.txt *.o *.i *.s *.elf

hello.txt:
	echo "hello world!" > hello.txt

%.i: %.c
	$(CPP) $< > $@

%.s: %.i
	$(CC) -S $<

%.o: %.s
	$(AS) $< -o $@

%.elf: %.o
	$(LD) $< -o $@

OBJS=main.o second.o

firmware.elf: $(OBJS)
	$(LD) -o $@ $^

%.img: %.elf
	$(OBJCOPY) $< -O binary $@

.PHONY: all clean