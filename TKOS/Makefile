ASM=nasm

SRC_DIR=src
BUILD_DIR=build

#
# OS IMAGE
#

OS: bootloader kernel
	cat ./$(BUILD_DIR)/boot.bin ./$(BUILD_DIR)/kernel.bin > ./$(BUILD_DIR)/tkos.bin
	

#
# BOOTLOADER
#

bootloader: $(SRC_DIR)/bootloader/boot.asm
	$(ASM) $(SRC_DIR)/bootloader/boot.asm -f bin -o $(BUILD_DIR)/boot.bin


#
# KERNEL
#

kernel: $(SRC_DIR)/kernel/kernel.asm
	$(ASM) $(SRC_DIR)/kernel/kernel.asm -f bin -o $(BUILD_DIR)/kernel.bin

clean:
	rm -r ./build/*



