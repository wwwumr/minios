all: build-img run-bochs

mount-fat:
	mkdir media
	mount -t vfat -o loop boot.img media/
	cp loader.bin media/
	sync
	umount media
	rmdir media

# the size of floppy is often 1.44M, that is 1474560B, create floppy image and write first block
build-img:
	nasm boot.asm -o boot.bin
	nasm loader.asm -o loader.bin
	dd if=/dev/zero of=boot.img bs=1024 count=1440 conv=notrunc
	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc

run-qemu:
	qemu-system-x86_64 -fda boot.img -serial mon:stdio -display curses

run-bochs:
	bochs -f ./bochsrc

clean-log:
	rm *.txt

clean:
	rm bochsout.txt *.img *.bin