org 7C00h ; set the start address to 7c00h auto 
bits 16  

%include "./bootsector/defines.asm" 

; FAT REQUIRMENT 
jmp segmentsSetUp 
nop 

;BIOS PARAMTER BLOCK 
%include "./bootsector/bpb.asm"

;set up the registed for memory and stack use ... 
segmentsSetUp:
    mov bx,cs ; or mov bx,MBR_CS
    mov ds,bx
    mov ss,bx 

banner: 
    mov si , banner_str
    call print_string 


DiskManipulation : 
    mov ax , (BIOS_MEM_READ << 8 ) + NUM_OF_SECTORS 
    mov dx , ( TRACK_NUM << 8 ) +  DRIVE_NUM 
    mov ch , (CYILNDER_NUM << 8) + SECTOR_NUM 
    mov bx , KERNEL_CS 
    mov es , bx
    int 0x13 
    jnc disk_ok ; if canary is on jump to disk error 
    disk_error :
        mov si , disk_error_str
        call print_string 
        jmp end 
    disk_ok : 
        mov si ,disk_ok_str
        call print_string 
        jmp end 
end :    
jmp $

; INCLUDES  
%include "./bootsector/string.asm"

; STRINGS 
banner_str db "idan maman's os",13, 10 , 0 
; 512 align and magic 
times 510-($-$$) db 0 
dw 0xaa55 
