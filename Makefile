# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaisago <adam_bai@protonmail.com>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/13 11:54:38 by abaisago          #+#    #+#              #
#    Updated: 2020/09/13 13:42:28 by abaisago         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

######################################################################
#                            DEFINITIONS                             #
######################################################################

#------------------------------------------------#
#                     PROJECT                    |
#------------------------------------------------#

ASM            := asm
CW             := corewar
NAME           := $(ASM) $(COREWAR)
PROJECT        := Corewar

#------------------------------------------------#
#                   LIBRARIES                    |
#------------------------------------------------#

LIB_PATH       := lib

LIB_FT_DIR     := $(LIB_PATH)/ft
LIB_FT_NAME    := libft.a
LIB_FT         := $(LIB_FT_DIR)/$(LIB_FT_NAME)
LIB_FT_DBG     := $(LIB_FT_DIR)/debug/$(LIB_FT_NAME)
LIB_FT_FLAGS   := -lft

LIB            := $(LIB_FT)
LIB_DBG        := $(LIB_FT_DBG)

LDFLAGS        := -L$(LIB_FT_DIR)
LDFLAGS_DBG    := -L$(LIB_FT_DIR)/debug
LDLIBS         := $(LIB_FT_FLAGS)

#------------------------------------------------#
#                   BINARIES                     |
#------------------------------------------------#

CC             := gcc
CFLAGS         := -Wall -Wextra -Werror
CPPFLAGS       := -Iinclude                      \
                  -Iinclude/asm                  \
                  -Iinclude/corewar              \
                  -Ilib/ft/include

AR             := /usr/bin/ar
ARFLAGS        := rc
MAKE           := /usr/bin/make
RANLIB         := /usr/bin/ranlib

CP             := /bin/cp
NORMINETTE     := /usr/bin/norminette
MKDIR          := /bin/mkdir
PRINTF         := /usr/bin/printf
RM             := /bin/rm

#------------------------------------------------#
#                    SOURCES                     |
#------------------------------------------------#

SRC_PATH       := src

SUB_ASM_LEX	   :=	lexer.c				\
					handle_lexer.c
SUB_ASM_LEX    := $(addprefix lexer/, $(SUB_ASM_LEX))

SUB_ASM_PAR    :=	check_arg1.c		\
					check_arg2.c		\
					check_op1.c			\
					check_op2.c			\
					handle_parser.c		\
					parser.c
SUB_ASM_PAR	   := $(addprefix parser/, $(SUB_ASM_PAR))

SUB_ASM_TRANS  := 	translator.c		\
					compute.c			\
					increment.c			\
					handle_label.c		\
					write_tool1.c		\
					write_tool2.c		\
					write_op1.c			\
					write_op2.c
SUB_ASM_TRANS  := $(addprefix translator/, $(SUB_ASM_TRANS))

SUB_ASM        := 	main.c asm.c asm_tool.c		\
					$(SUB_ASM_LEX)				\
					$(SUB_ASM_PAR)				\
					$(SUB_ASM_TRANS)			\
					tools1.c					\
                    dbg.c
SUB_ASM        := $(addprefix asm/, $(SUB_ASM)) corewar/util.c
SUB_LIB        := ft_string_nappend.c ft_strisnumber.c ft_list_count.c
SUB_LIB        := $(addprefix lib/, $(SUB_LIB))
SRC_NAME_ASM   := $(SUB_ASM) $(SUB_LIB)
SRC_ASM        := $(addprefix $(SRC_PATH)/,$(SRC_NAME_ASM))

#------------------------------------------------#

SUB_CW_OP      := add.c   \
                  aff.c   \
                  and.c   \
                  fork.c  \
                  ld.c    \
                  ldi.c   \
                  lfork.c \
                  live.c  \
                  lld.c   \
                  lldi.c  \
                  nop.c   \
                  or.c    \
                  st.c    \
                  sti.c   \
                  sub.c   \
                  xor.c   \
                  zjmp.c   \
				  op_arg_type.c
SUB_CW_OP      := $(addprefix op/, $(SUB_CW_OP))

SUB_CW         := main.c corewar.c \
                  builtin.c        \
                  checks.c         \
                  cursor.c         \
                  debug.c          \
                  game.c           \
                  options.c        \
                  player.c         \
                  util.c           \
                  verbose.c        \
                  vm.c             \
                  $(SUB_CW_OP)
SUB_CW         := $(addprefix corewar/, $(SUB_CW))

SRC_NAME_CW    := $(SUB_CW)
SRC_CW         := $(addprefix $(SRC_PATH)/,$(SRC_NAME_CW))

#------------------------------------------------#

OBJ_PATH       := obj
OBJ_NAME_ASM   := $(SRC_NAME_ASM:.c=.o)
OBJ_NAME_CW    := $(SRC_NAME_CW:.c=.o)
OBJ_ASM        := $(addprefix $(OBJ_PATH)/,$(OBJ_NAME_ASM))
OBJ_CW         := $(addprefix $(OBJ_PATH)/,$(OBJ_NAME_CW))

#------------------------------------------------#
#                    RELEASE                     |
#------------------------------------------------#

REL_PATH       := release
ASM            := $(ASM)
CW             := $(CW)
REL            := $(ASM) $(CW)
REL_OBJ_ASM    := $(addprefix $(REL_PATH)/,$(OBJ_ASM))
REL_OBJ_CW     := $(addprefix $(REL_PATH)/,$(OBJ_CW))
REL_CFLAGS     := $(CFLAGS)

#------------------------------------------------#
#                     DEBUG                      |
#------------------------------------------------#

DBG_PATH       := debug
DBG_ASM        := $(addprefix $(DBG_PATH)/, $(ASM))
DBG_CW         := $(addprefix $(DBG_PATH)/, $(CW))
DBG            := $(DBG_ASM) $(DBG_CW)
DBG_OBJ_ASM    := $(addprefix $(DBG_PATH)/,$(OBJ_ASM))
DBG_OBJ_CW     := $(addprefix $(DBG_PATH)/,$(OBJ_CW))
DBG_CFLAGS     := $(CFLAGS) -g3

#------------------------------------------------#
#                     EXTRA                      |
#------------------------------------------------#

EOC         := "\033[0;0m"
RED         := "\033[0;31m"
GREEN       := "\033[0;32m"

BASENAME    := `basename $(PWD)`
CREAT       := $(CR)$(GREEN)
DEL         := $(CR)$(RED)
END         := $(EOC)"\033[0K\n"
UP          := "\033[0F"



######################################################################
#                               RULES                                #
######################################################################
.PHONY: all clean fclean re release dbg
.SILENT:

all: release

mdebug:
	$(PRINTF) "rel = $(REL)\n"
	$(PRINTF) "asm = $(ASM)\n"
	$(PRINTF) "asm_OBJ = $(REL_OBJ_ASM)\n"
	$(PRINTF) "cw = $(CW)\n"
	$(PRINTF) "cw_OBJ = $(REL_OBJ_CW)\n"

#------------------------------------------------#
#                 RELEASE-RULES                  |
#------------------------------------------------#

release: $(REL)

$(ASM): $(LIB) $(REL_OBJ_ASM)
	@$(PRINTF) $(CREAT)"[ $(PROJECT): $@ object files created ]"$(END)
	@$(CC) $(REL_CFLAGS) -o $@ $^ $(LDFLAGS) $(LDLIBS)
	@$(PRINTF) $(CREAT)"[ $(PROJECT): $@ created ]"$(END)

$(CW): $(LIB) $(REL_OBJ_CW)
	@$(PRINTF) $(CREAT)"[ $(PROJECT): $@ object files created ]"$(END)
	@$(CC) $(REL_CFLAGS) -o $@ $^ $(LDFLAGS) $(LDLIBS)
	@$(PRINTF) $(CREAT)"[ $(PROJECT): $@ created ]"$(END)

$(REL_PATH)/$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c
	@$(MKDIR) -p $(dir $@) 2>/dev/null || true
	@$(PRINTF) "[ $(PROJECT): %s ]"$(END) $@
	@$(CC) $(REL_CFLAGS) $(CPPFLAGS) -c $< -o $@
	@$(PRINTF) $(UP)

#------------------------------------------------#
#                  DEBUG-RULES                   |
#------------------------------------------------#

dbg: $(DBG)

$(DBG_ASM): $(LIB_DBG) $(DBG_OBJ_ASM)
	@$(PRINTF) $(CREAT)"[ $(PROJECT): All debug object files created ]"$(END)
	@$(CC) $(DBG_CFLAGS) -o $@ $^ $(LDFLAGS_DBG) $(LDLIBS)
	@$(PRINTF) $(CREAT)"[ $(PROJECT): $@ created ]"$(END)

$(DBG_CW): $(LIB_DBG) $(DBG_OBJ_CW)
	@$(PRINTF) $(CREAT)"[ $(PROJECT): All debug object files created ]"$(END)
	@$(CC) $(DBG_CFLAGS) -o $@ $^ $(LDFLAGS_DBG) $(LDLIBS)
	@$(PRINTF) $(CREAT)"[ $(PROJECT): $@ created ]"$(END)

$(DBG_PATH)/$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c
	@$(MKDIR) -p $(dir $@) 2>/dev/null || true
	@$(PRINTF) "[ $(PROJECT): %s ]"$(END) $@
	@$(CC) $(DBG_CFLAGS) $(CPPFLAGS) -c $< -o $@
	@$(PRINTF) $(UP)

#------------------------------------------------#
#                 LIBRARY-RULES                  |
#------------------------------------------------#

### LIBFT

libft: $(LIB_FT)
$(LIB_FT): FORCE
	make -sC $(LIB_FT_DIR)

$(LIB_FT_DBG): FORCE
	make -sC $(LIB_FT_DIR) dbg

libft_clean:
	make -sC $(LIB_FT_DIR) clean

libft_dbgclean:
	make -sC $(LIB_FT_DIR) dbgclean

libft_fclean:
	make -sC $(LIB_FT_DIR) fclean

### Library Clean Rules

libclean: libft_clean
libdbgclean: libft_dbgclean
libfclean: libft_fclean

#------------------------------------------------#
#                  CLEAN-RULES                   |
#------------------------------------------------#

thisclean:
	@if [ -d $(REL_PATH)/$(OBJ_PATH) ]; then \
		$(RM) -f $(REL_OBJ) \
		&& $(RM) -rf $(REL_PATH)/$(OBJ_PATH) \
		&& $(PRINTF) $(DEL)"[ $(PROJECT): All object files cleaned ]"$(END); \
	fi
ifneq '$(REL_PATH)' '.'
	@$(RM) -rf $(REL_PATH)
endif

thiscleandbg:
	@if [ -d $(DBG_PATH)/$(OBJ_PATH) ]; then \
		$(RM) -f $(DBG_OBJ) \
		&& $(RM) -rf $(DBG_PATH)/$(OBJ_PATH) \
		&& $(PRINTF) $(DEL)"[ $(PROJECT): All debug object files cleaned ]"$(END); \
	fi
ifneq '$(DBG_PATH)' '.'
	@$(RM) -rf $(DBG_PATH)
endif


clean: libclean thisclean
cleandbg: libcleandbg thiscleandbg

binclean:
	@for TARGET in $(REL); do \
		if [ -e "$$TARGET" ]; then \
			$(RM) -f $$TARGET \
			&& $(PRINTF) $(DEL)"[ $(PROJECT): $$TARGET cleaned ]"$(END); \
		fi; \
	done

bincleandbg:
	@for TARGET in $(DBG); do \
		if [ -e "$$TARGET" ]; then \
			$(RM) -f $$TARGET \
			&& $(PRINTF) $(DEL)"[ $(PROJECT): $$TARGET cleaned ]"$(END); \
		fi; \
	done

fclean: libfclean thisclean thiscleandbg binclean bincleandbg

#------------------------------------------------#
#                  EXTRA-RULES                   |
#------------------------------------------------#

soft: thisclean all
softdbg: thiscleandbg dbg
shallow: soft softdbg
re: fclean all
redbg: fclean dbg
full: fclean all dbg

neat: all clean
neatdbg: dbg cleandbg
pure: clear cleardbg
whole: all dbg

FORCE:

norme:
	$(NORMINETTE) $(SRC) include/*.h

update_libft:
	$(RM) -rf $(LIB_FT_DIR)
	git clone http://gitlab.com/abaisago/42_libft $(LIB_FT_DIR)
	$(RM) -rf $(LIB_FT_DIR)/.git* $(LIB_FT_DIR)/tags

update_libht:
	$(RM) -rf $(LIB_HT_DIR)
	git clone http://gitlab.com/abaisago/libht $(LIB_HT_DIR)
	$(RM) -rf $(LIB_HT_DIR)/.git* $(LIB_HT_DIR)/tags
