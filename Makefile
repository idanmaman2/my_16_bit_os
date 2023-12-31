ASSEMBLER=nasm 
IMAGE_CONVERT=qemu-img convert
BUILD_DIR = "./build"
OBJ_DIR = "./objdir"
BOOTLOADER = "./bootsector"
KERNEL = "./kernel"
NAME=idkidc
HARDDISKDIR="./filesystem"
.PHONY : all disk bootloader kernel install-kernel convert
all : disk bootloader filesystem kernel install-kernel convert 

disk : 
	dd bs=512 count=2880 if=/dev/zero of=$(BUILD_DIR)/$(NAME).img

bootloader : 
	$(ASSEMBLER) $(BOOTLOADER)/mbr.asm -f bin -o $(OBJ_DIR)/mbr.bin 
	dd conv=notrunc if=$(OBJ_DIR)/mbr.bin  of=$(BUILD_DIR)/$(NAME).img

filesystem : 
	echo "idk" 

kernel : 
	$(ASSEMBLER) $(KERNEL)/kernel.asm -f bin -o $(OBJ_DIR)/kernel.bin 

install-kernel :	
	mkdir  -p $(HARDDISKDIR)
	mount $(BUILD_DIR)/$(NAME).img	$(HARDDISKDIR)
	fatlabel $(BUILD_DIR)/$(NAME).img "IDKIDC"
	cp 	$(OBJ_DIR)/kernel.bin  $(HARDDISKDIR)/KERNEL.SYS
	fatattr +s $(HARDDISKDIR)/KERNEL.SYS
	mkdir $(HARDDISKDIR)/HOME/
	umount $(HARDDISKDIR)
	rm -rf $(HARDDISKDIR)

convert : 
	$(IMAGE_CONVERT) -f raw -O qcow2 $(BUILD_DIR)/$(NAME).img $(BUILD_DIR)/image.qcow2
clean: 
	rm  $(OBJ_DIR)/*
	rm $(BUILD_DIR)/*
