C_SOURCE = $(wildcard kernel/*.c driver/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h)
OBJ = $(C_SOURCE:.c=.o)
CC = gcc

run: os-image
	qemu-system-x86_64 $<

os-image: boot/boot_sect.bin kernel.bin
	cat $^ > $@

%.o: %.c $(HEADERS)
	$(CC) -ffreestanding -c $< -o $@

%.o: %.asm
	nasm $< -f elf64 -o $@

%.bin: %.asm
	nasm $< -f bin -o $@

kernel.bin: kernel/kernel_entry.o ${OBJ}
	ld -o $@ -Ttext 0x1000 $^ --oformat binary
clean:
	rm -rf *.bin *.o os-image
	rm -rm kernel/*.o boot/*.bin /drivers/*.o
