NAME		=	otosense

CC			=	clang
CFLAGS		=	-Wall -Werror -Wextra
XFLAGS		=	#-flags -for -X
FLAGS		=	$(CFLAGS) $(XFLAGS)

SRC_DIR		=	src
SRC_FILE	=	main.c #TODO
SRCS		=	$(addprefix $(SRC_DIR)/, $(SRC_FILE))

OBJ_DIR		=	obj
OBJ_FILE	=	$(SRC_FILE:.c=.o)
OBJS		=	$(addprefix $(OBJ_DIR)/, $(OBJ_FILE))

INC_DIR		=	-I inc

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(SRCS) | $(OBJS)
	$(CC) $(FLAGS) $(OBJS) $(INC_DIR) -o $(NAME) #WARNING: will not compile on linux unless the library is at the end of the line

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@$(CC) -c $^ $(CFLAGS) $(INC_DIR) -o $@

clean:
	@rm -rf $(OBJ_DIR)

fclean: clean
	@rm -f $(NAME)

re: fclean all

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)
