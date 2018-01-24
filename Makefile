NAME		=	foo

CC			=	clang
CFLAGS		=	-Wall -Werror -Wextra
FLAGS		=	$(CFLAGS)

SRC_DIR		=	src
SRC_FILE	=	main.c #TODO
SRCS		=	$(addprefix $(SRC_DIR)/, $(SRC_FILE))

OBJ_DIR		=	obj
OBJ_FILE	=	$(SRC_FILE:.c=.o)
OBJS		=	$(addprefix $(OBJ_DIR)/, $(OBJ_FILE))

PORTAUDIO_DIR	=	portaudio
PORTAUDIO_LIB	=	libportaudio.a
PORTAUDIO_INC	=	include
PORTAUDIO		=	$(PORTAUDIO_DIR)/$(PORTAUDIO_LIB)


INC_DIR		=	-I $(PORTAUDIO_DIR)/$(PORTAUDIO_INC) -I inc

.PHONY: portaudio all clean fclean re

all: $(PORTAUDIO) $(NAME)

$(NAME): $(SRCS) | $(OBJS)
	$(CC) $(FLAGS) $(PORTAUDIO) $(OBJS) $(INC_DIR) -o $(NAME) #WARNING: will not compile on linux unless the library is at the end of the line

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@$(CC) -c $^ $(CFLAGS) $(INC_DIR) -o $@

clean:
	@cd $(PORTAUDIO_DIR) && make clean
	@rm -rf $(OBJ_DIR)

fclean: clean
	@cd $(PORTAUDIO_DIR) && make fclean
	@rm -f $(NAME)

re: fclean all

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

$(PORTAUDIO):
	@$(MAKE) -C $(PORTAUDIO_DIR)
