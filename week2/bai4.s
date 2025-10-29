
.section .bss 
    .lcomm number1, 4 
    .lcomm tmp, 1 
    .lcomm left, 1 
    .lcomm middle, 1 
    .lcomm right, 1 


.section .data
    rs: 
        .string "Enter a number (3-digit): "
    rs_len = . -rs
    endl: 
        .string "\n"
    endl_len = . -endl
    KHONGTANGDAN:   
        .string "Khong tang dan" 
    KHONGTANGDAN_len = . -KHONGTANGDAN
    TANGDAN: 
        .string "Tang dan" 
    TANGDAN_len = . -TANGDAN

# as --32 bai4.s -o bai4.o && ld bai4.o -o bai4 -m elf_i386 
.section .text 
    .global _start 
    

.newline: 
    movl $4, %eax
    movl $1, %ebx 
    movl $endl, %ecx 
    movl $endl_len, %edx 
    int $0x80

_start: 

    movl $4, %eax 
    movl $1, %ebx 
    movl $rs_len, %edx 
    movl $rs, %ecx 
    int $0x80

    
    
    movl $3, %eax 
    movl $0, %ebx 
    movl $4, %edx 
    movl $number1, %ecx 
    int $0x80

    

    movl $4, %eax 
    movl $1, %ebx 
    movl $number1, %ecx 
    movl $4, %edx 
    int $0x80

    movl $number1, %eax 
    movb (%eax), %bl 

    movb %bl, left     

    movl $number1, %eax 
    movb 1(%eax), %bl 

    movb %bl, middle   

    movl $number1, %eax 
    movb 2(%eax), %bl 


    movb %bl, right

   



    movb middle, %al 
    cmp left, %al
    jl .khongtangdan
    
    cmp right, %al 
    jg .khongtangdan

    jmp .tangdan

    



.tangdan: 
    movl $4, %eax 
    movl $1, %ebx 
    movl $TANGDAN, %ecx 
    movl $TANGDAN_len, %edx 
    int $0x80 

    movl $4, %eax 
    movl $1, %ebx 
    movl $endl, %ecx 
    movl $endl_len, %edx 
    int $0x80 

    movl $1, %eax 
    xor %ebx, %ebx 
    int $0x80


.khongtangdan:
    movl $4, %eax 
    movl $1, %ebx 
    movl $KHONGTANGDAN, %ecx 
    movl $KHONGTANGDAN_len, %edx 
    int $0x80 

    movl $4, %eax 
    movl $1, %ebx 
    movl $endl, %ecx 
    movl $endl_len, %edx 
    int $0x80 

    movl $1, %eax 
    xor %ebx, %ebx 
    int $0x80



