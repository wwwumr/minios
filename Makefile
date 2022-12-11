all: run-bochs

build-qemu:
	nasm boot.asm -o boot.bin
	qemu-img create boot.img 1474560B
	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc
	qemu-img create disk.img 10M

build-bochs:
	nasm boot.asm -o boot.bin
	bximage
	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc
	bximage

run-bochs:
	bochs -f ./bochsrc

clean-log:
	rm *.txt

clean:
	rm bochsout.txt boot.img disk.img boot.bin