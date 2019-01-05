##
## EPITECH PROJECT, 2018
## malloc
## File description:
## Makefile for malloc
##

NAME		=	libasm.so

SRC		=	src/memcpy.asm		\
			src/memmove.asm		\
			src/memset.asm		\
			src/rindex.asm		\
			src/strcasecmp.asm	\
			src/strchr.asm		\
			src/strcmp.asm		\
			src/strcspn.asm		\
			src/strlen.asm		\
			src/strncmp.asm		\
			src/strpbrk.asm		\
			src/strstr.asm

OBJ		=	$(SRC:.asm=.o)

ASMFLAGS	=	-f elf64

ASM		=	nasm

LDFLAGS		=	-fPIC -shared

LD		=	ld

%.o: %.asm
	@$(ASM) -o $@ $< $(ASMFLAGS)

all:	$(NAME)

$(NAME): $(OBJ)
	$(LD) $(LDFLAGS) -o $(NAME) $(OBJ)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re:	fclean all

.PHONY:	all clean fclean re
