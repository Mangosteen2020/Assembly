.section .data
msg:
	.ascii "Hello World.\n"
len = . - msg

.section .text
.globl _start
_start:
	nop
	movl $4 ,%eax
	movl $1 ,%ebx
	movl $msg ,%ecx
	movl $len ,%edx
	int $0x80

	movl $1 ,%eax
	movl $0 ,%ebx
	int $0x80
