TARGET = nags

build: $(TARGET).asm
	nasm -f elf -o $(TARGET).o $(TARGET).asm
#	gcc -m32 -o $(TARGET) $(TARGET).o -lc  USE THIS TO INCLUDE C LIBRARY
	ld -m elf_i386 -o $(TARGET) $(TARGET).o
