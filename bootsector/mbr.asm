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

disk_init:
    mov ah ,  BIOS_RESET_DISK
    mov dl , DRIVE_NUM
    jc disk_init_error 
    lea si ,[disk_ok_str] 
    jmp disk_init_exit 
    disk_init_error :
        lea si , [disk_error_str] 
    disk_init_exit:  
        call print_string
disk_read : 
    mov ax , () 
end :    
    jmp $

; INCLUDES  
%include "./bootsector/string.asm"

; STRINGS 
disk_error_str db "disk error",13,10,0 
disk_ok_str db "disk ok",13,10,0 
banner_str db "idan maman's os",13,10,0 
; 512 align and magic 
times 510-($-$$) db 0 
dw 0xaa55 
