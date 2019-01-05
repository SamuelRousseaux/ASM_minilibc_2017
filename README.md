# ASM\_minilibc\_2017


## Project
Epitech 2nd year project.

This project consists of creating a dynamic ELF library to replace (to a certain extent) the standard.

It contains : 

* strlen
* strchr
* memset
* memcpy
* strcmp
* memmove
* strncmp
* strcasecmp
* rindex
* strstr
* strpbrk
* strcspn

The language used is *x86-64 Assembly*.



## Prerequisites
To compile the library, you'll need **nasm** installed on your machine.



## How to use it
To use this library, you first need to compile it using the Makefile :
    
    make re && make clean

Then, you compile your program like you would do usually, and finally, you preload the library and launch your binary file :

    LD_PRELOAD=./libasm.so ./your_binary [args]



## changelog
* 01/05/19 : added files

