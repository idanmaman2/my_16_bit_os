;memregions 

BIOS_MEM equ 7C00h
VIDEO_MEM equ 7C00h
FREE_MEM equ 7C00h


;kind of comment - can be removed 
MBR_CS equ 07c0h ; the value of cs 
MBR_SS equ MBR_CS
MBR_DS equ MBR_CS 
MBR_ES equ MBR_CS 

;value of the addresses 
KERNEL_CS equ 0a000h
KERNEL_SS equ 0
KERNEL_DS equ 0
KERNEL_ES equ 0

;int 0x10 : SCREEN 
BIOS_CHAR_PRINT equ 0x0e
BIOS_PRINT_STRING equ 0x13 

; int 0x13 : DISK 
BIOS_MEM_READ equ 02h

; disk settings 
DRIVE_NUM equ 0 
TRACK_NUM equ 1
CYILNDER_NUM equ 3 
SECTOR_NUM equ 4
NUM_OF_SECTORS equ 5 

