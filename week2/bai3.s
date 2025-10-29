.section .data
sting:
    .ascii "Enter a character: "
len_sting = . - sting

chu_hoa:
    .ascii "chuhoa\n"
len_chu_hoa = . - chu_hoa

chu_thuong:
    .ascii "chuthuong\n"
len_chu_thuong = . - chu_thuong

.section .bss
    .lcomm number1, 2

.section .text
    .global _start

_start:
    # write(1, sting, len_sting)
    movl $4, %eax
    movl $1, %ebx
    movl $sting, %ecx
    movl $len_sting, %edx
    int $0x80

    # read(0, number1, 2)
    movl $3, %eax
    movl $0, %ebx
    movl $number1, %ecx
    movl $2, %edx
    int $0x80

    # EAX = (unsigned)number1[0]
    movzbl number1, %eax
    mov   %al, %dl          # DL = ký tự

    # if 'A' <= ch <= 'Z' -> chu_hoa
    cmpb $'A', %dl
    jl .other
    cmpb $'Z', %dl
    jle .is_upper

    # if 'a' <= ch <= 'z' -> chu_thuong
    cmpb $'a', %dl
    jl .other
    cmpb $'z', %dl
    jle .is_lower
    jmp .other

.is_upper:
    # write(1, chu_hoa, len_chu_hoa)
    movl $4, %eax
    movl $1, %ebx
    movl $chu_hoa, %ecx
    movl $len_chu_hoa, %edx
    int $0x80
    jmp .exit

.is_lower:
    # write(1, chu_thuong, len_chu_thuong)
    movl $4, %eax
    movl $1, %ebx
    movl $chu_thuong, %ecx
    movl $len_chu_thuong, %edx
    int $0x80
    jmp .exit

.other:
    # (tuỳ chọn) không phải chữ cái -> in chu_thuong hoặc thông báo khác
    movl $4, %eax
    movl $1, %ebx
    movl $chu_thuong, %ecx
    movl $len_chu_thuong, %edx
    int $0x80

.exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80
