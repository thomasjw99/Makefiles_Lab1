CPP=$(PICO_TOOLCHAIN_PATH)/arm-none-eabi-cpp
CC=$(PICO_TOOLCHAIN_PATH)/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/arm-none-eabi-as

main.s: main.i
	$(CC) -S main.i

main.o: main.s
	$(AS) main.s -o main.o

second.o: second.s
	$(AS) second.s -o second.o

hello.txt:
	echo "hello world!" > hello.txt

main.i: main.c
	$(CPP) main.c > main.i

clean:
	rm -f main.i hello.txt

.PHONY: clean