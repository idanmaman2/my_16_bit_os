; bios paramter block for NTFS file system 
; this code wat writen by IDHM ;-; 


;==========BPB==========
bpbOEMLabel:            db "$IdkIdc$"                                       
bpbBytesPerSector:      dw 512                                               
bpbSectorsPerCluster:   db 1                                                  
bpbReservedSectors:     dw 2                                                 
bpbNumberOfFats:        db 2                                              
bpbRootDirEntries:      dw 224                                           
bpbLogicalSectors:      dw 2880                                             
bpbMediaDescriptorType: db 0xF0                                               
bpbSectorsPerTable:     dw 9                                                  
bpbSectorsPerTrack:     dw 18                                                
bpbHeadsPerCylinder:    dw 2                                                 
bpbHiddenSectors:       dd 1                                                  
bpbLargeSectors:        dd 0                                                 
bpbDriveNumber:         db 5                                                  
bpbNTReserved:          db 0                                                  
bpbSignature:           db 0x29                                             
bpbVolumeID:            dd 42                                                 
bpbVolumeLabel:         db "FDOS v0.1  "                                     
bpbFileSystem:          db "FAT12   "                                        
;=========END============