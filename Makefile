.PHONY : all build clean run

all : clean build run

build :
	riscv64-linux-gnu-as mbl.s -o mbl.o && riscv64-linux-gnu-ld mbl.o -T min.ld -o mbl.elf

clean :
	rm -f *.o *.elf

run :
	qemu-system-riscv64 -M virt --bios mbl.elf
