print_string : 
    mov ah , BIOS_CHAR_PRINT
    loop_print_string:
        lodsb
        cmp al , 0 
        jz end_print_string
        int 0x10 
        jmp loop_print_string
    end_print_string: 
        ret 
