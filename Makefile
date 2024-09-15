CPP=$(PICO_TOOLCHAIN_PATH)/arm-none-eabi-cpp
CC=$(PICO_TOOLCHAIN_PATH)/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/arm-none-eabi-as
LD=$(PICO_TOOLCHAIN_PATH)/arm-none-eabi-ld
OBJCOPY=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-objcopy

SRC=main.c second.c
OBJS=$(patsubst %.c,%.o,$(SRC))

all: firmware.elf

clean:
	rm -f *.i *.txt *.o *.s *.elf

%.i: %.c
	$(CPP) $< > $@

%.s: %.i
	$(CC) $< -S $@

%.o: %.s
	$(AS) $< -o $@

firmware.elf: $(OBJS)
	$(LD) -o $@ $^

hello.txt:
	echo "hello world!" > hello.txt

.PHONY: all clean