# as --32 code.asm -o code.o && ld code.o -o code -m elf_i386 

.section .data
    sting:
        .ascii "Enter a number (1-digit): "
    rs = . -sting 
    nl: .ascii "\n"

.section .bss 
    .lcomm number1, 2 
    .lcomm result, 2 
    
.section .text 
    .global _start 

_start: 
    movl $0, %edi 

    movl $4 , %eax
    movl $1 , %ebx 
    movl $sting, %ecx 
    movl $rs , %edx 
    int $0x80 

    movl $3, %eax 
    movl $0, %ebx
    movl $number1, %ecx 
    movl $2, %edx 
    int $0x80 


    movzbl number1, %eax
    subl $'0', %eax 

    addl %eax, %edi 
    ####1#####

    

    movl $4 , %eax
    movl $1 , %ebx 
    movl $sting, %ecx 
    movl $rs , %edx 
    int $0x80

    movl $3, %eax 
    movl $0, %ebx
    movl $number1, %ecx 
    movl $2, %edx 
    int $0x80
    
    movzbl number1, %eax
    subl $'0', %eax 
    addl %eax, %edi

    ####2###

    movl $4 , %eax
    movl $1 , %ebx 
    movl $sting, %ecx 
    movl $rs , %edx 
    int $0x80

    movl $3, %eax 
    movl $0, %ebx
    movl $number1, %ecx 
    movl $2, %edx 
    int $0x80
    
    movzbl number1, %eax
    subl $'0', %eax 
    addl %eax, %edi

    ####3#####
    movl $4 , %eax
    movl $1 , %ebx 
    movl $sting, %ecx 
    movl $rs , %edx 
    int $0x80

    movl $3, %eax 
    movl $0, %ebx
    movl $number1, %ecx 
    movl $2, %edx 
    int $0x80
    
    movzbl number1, %eax
    subl $'0', %eax 
    addl %eax, %edi
    ####4####
    movl %edi, %eax
    shrl $2, %eax            # EAX = avg

    # Nếu avg > 9 (phòng hờ), in 2 chữ số
    cmpl $9, %eax
    ja  .two_digits

.one_digit:
    addb $'0', %al           # AL = ASCII '0'..'9'
    movb %al, result         # result[0]
    # write(1, result, 1)
    movl $4, %eax
    movl $1, %ebx
    movl $result, %ecx
    movl $1, %edx
    int  $0x80
    jmp  .print_nl

.two_digits:

    xorl %edx, %edx
    movl $10, %ecx
    divl %ecx                 # EAX = tens, EDX = ones

    addb $'0', %al            # tens -> ASCII
    movb %al, result          # result[0]
    addb $'0', %dl            # ones -> ASCII
    movb %dl, result+1        # result[1]

    movl $4, %eax
    movl $1, %ebx
    movl $result, %ecx
    movl $2, %edx
    int  $0x80

.print_nl:
    # newline
    movl $4, %eax
    movl $1, %ebx
    movl $nl, %ecx
    movl $1, %edx
    int  $0x80

    movl $1, %eax
    xorl %ebx, %ebx
    int  $0x80

