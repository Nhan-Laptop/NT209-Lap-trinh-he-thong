# as --32 bai3.asm -o bai3.o && ld bai3.o -o bai3 -m elf_i386 
.section .data
    rs: 
        .string "Love KMA"
    rs_len = . -rs 
    digit: .byte  0 

.section .text 
    .global _start 

_start: 
    movl $1, %ebx 
    movl $4, %eax

    int $0x80
    movl $rs_len-1, %eax
    addb $'0', %al 
    movb %al, digit

    #in 1 ky tu 
    movl $4, %eax
    movl $1, %ebx 
    movl $digit, %ecx
    movl $1, %edx            
    int  $0x80


    movl $1, %eax 
    xorl %ebx, %ebx 
    int $0x80
    
