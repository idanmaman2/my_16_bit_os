; bios paramter block for NTFS file system 
; this code wat writen by IDHM ;-; 

;==========BPB==========
OEM                 db "$IdkIdc$"         ; OEM label
bytes_sector        dw 0x0200           ; Number of bytes per sector (DO NOT CHANGE)
sectors_cluster     db 0x01             ; Number of sectors per cluster
reserved            dw 0x0001           ; Number of sectors reserved for bootsector
fats                db 0x02             ; Number of FAT copies
root_entries        dw 0x00E0           ; Max number of root entries (For now, DO NOT CHANGE)
sectors             dw 0x0B40           ; Number of sectors in volume (small)
media_type          db 0xF0             ; Media descriptor
sectors_fat         dw 0x0009           ; Number of sectors per FAT
sectors_track       dw 0x0012           ; Number of sectors per Track
heads               dw 0x0002           ; Number of heads
sectors_hidden      dd 0x00000000       ; Number of hidden sectors
sectors_large       dd 0x00000000       ; Number of sectors in volume (large)
drive_num           db 0x00             ; Drive number (floppy)
                    db 0x00             ; Reserved byte
extended_sig        db 0x29             ; Next three fields are available
serial              dd 0x688B221B       ; Volume serial number
label               db "IDKIDC V0.1"      ; Volume label
filesystem          db "FAT12   "       ; Volume filesystem type
;=========END============