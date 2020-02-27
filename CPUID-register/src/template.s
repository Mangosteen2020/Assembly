.section .data
msg:
	.ascii "The processor Vendor ID is 'xxxxxxxxxxxx'\n"
len = . - msg

.section .text
.globl _start
_start:
	nop

	movl $0 ,%eax
	cpuid

	movl $msg ,%edi
	movl %ebx ,28(%edi)
	movl %edx ,32(%edi)
	movl %ecx ,36(%edi)

	movl $4 ,%eax
	movl $1 ,%ebx
	movl $msg ,%ecx
	movl $len ,%edx
	int $0x80

	movl $1 ,%eax
	movl $0 ,%ebx
	int $0x80
