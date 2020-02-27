# Template说明 #

## 目录文件说明 ##

- configure:初始化编译环境的配置文件  
- Makefile:编译的makefile脚本  
- Makfie.debug:添加了调试参数以及修改入口函数的参数  
- src:源文件目录  

## 使用说明 ##
- 第一次使用需要执行confiure脚本建立编译目录  
- 执行make命令进行编译
- bin目录下是编译出来的可执行文件  
- objs/src下是中间文件  


## 小提示 ##
示例程序是调用write系统调用在终端是输出:  
> Hello World.。    

然后调用exit系统调用返回0退出。  
模板程序展现了AT&T汇编语言最基本的框架。  
汇编程序中以.开头的名称并不是指令的助记符，不会被翻译成机器指令，是给汇编器看的"伪"指令。  
.section表示把代码划分成不同的段，.data表示数据段用于存储明确初始化的变量且非const，该段可读可写(C里面的全局初始化变量，static变量等)。
> .section .data  

注:  
> .bss表示未明确初始化的变量或者初始化为0的变量  
> .rodata表示只读数据(const)

.text表示代码段，存储执行的指令，该段可读可执行
> .section .text
  
.globl标签表示到处，后面跟的标签表示可以被链接器访问的。_start表示程序的入口地址(相当于C里面的main)。  
nop指令表示啥也不干  
> movl $4 ,%eax  
> movl $1 ,%ebx  
> movl $msg ,%ecx  
> movl $len ,%edx  
> int $0x80  

这段代码对应的C语言 syscall(SYS_write ,1 ,msg ,len);

> movl $1 ,%eax  
> movl $0 ,%ebx  
> int $0x80 

这段对应的C语言 syscall(SYS_exit ,0);
具体系统调用可以查看/usr/include/bits/syscall.h

## 特别说明 ##
- ld默认的入口参数是_start ,可以使用-e参数指定新的入口函数
> .globl _entry  
> ld -e _entry xxx.s  

- gcc也可以直接编译
> gcc xxxx.s  
gcc默认使用的入口函数是main，所以一般标签需要改成main
> .globl main  

gcc也支持修改入口函数  
> gcc  -nostartfiles -e _start xxxx.s  

