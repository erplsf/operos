.PHONY: all

all: clean build pack

clean:
	rm -f *.efi *.EFI *.so *.o *.img

build:
	gcc -I/usr/include/efi/ -fpic -ffreestanding -fno-stack-protector -fno-stack-check -fshort-wchar -mno-red-zone -maccumulate-outgoing-args -c main.c -o main.o
	ld -shared -Bsymbolic -L/usr/lib/ -T/usr/lib/elf_x86_64_efi.lds /usr/lib/crt0-efi-x86_64.o main.o -o main.so -lgnuefi -lefi
	objcopy -j .text -j .sdata -j .data -j .dynamic -j .dynsym  -j .rel -j .rela -j .rel.* -j .rela.* -j .reloc --target efi-app-x86_64 --subsystem=10 main.so BOOTX64.EFI

pack:
	dd if=/dev/zero of=qaub.img bs=1k count=1440
	mformat -i qaub.img -f 1440 ::
	mmd -i qaub.img ::/EFI
	mmd -i qaub.img ::/EFI/BOOT
	mcopy -i qaub.img BOOTX64.EFI ::/EFI/BOOT

run:
	qemu-system-x86_64 -bios /usr/share/edk2-ovmf/x64/OVMF.fd -drive format=raw,file=qaub.img
