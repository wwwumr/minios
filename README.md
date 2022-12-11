# MiniOS
minios for practice

## Bochs

Dependencies: `make nasm bochs`

Assembly code in `boot.asm`

Bochs configuration file is `bochsrc`, the main point is to set boot priority

Because we use `boot.img` and `disk.img` for floppy and disk image name, name them when building

1. make build-bochs
2. make run-bochs