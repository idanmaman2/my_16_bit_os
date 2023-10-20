%include "./bootsector/defines.asm" 
disk_init: ;uses ax , dx - ax, dx  needs to be free!  caller responsibility not calle!!!  
    mov ah ,  BIOS_RESET_DISK
    mov dl , DRIVE_NUM
    mov bp , disk_error_str
    jc error 
    lea si ,[disk_ok_str] 
    jmp disk_init_exit 
    disk_init_error :
        lea si , [disk_error_str] 
    disk_init_exit:  
        call print_string
        ret 
disk_error_str db "disk error",13,10 , 0 
disk_ok_str db "disk ok\n" , 0 
 