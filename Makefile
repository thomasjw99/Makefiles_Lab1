CPP=$(PICO_TOOLCHAIN_PATH)/arm-none-eabi-cpp
CC=$(PICO_TOOLCHAIN_PATH)/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/arm-none-eabi-as

clean:
	rm -f main.i hello.txt

%.i: %.c
	$(CPP) $< > $@

%.s: %.i
	$(CC) $< -S $@

%.o: %.s
	$(AS) $< -o $@

hello.txt:
	echo "hello world!" > hello.txt

.PHONY: clean