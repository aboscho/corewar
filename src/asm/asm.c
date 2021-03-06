/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   asm.c                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abosch <abosch@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/12 21:50:54 by abosch            #+#    #+#             */
/*   Updated: 2020/09/13 11:25:15 by abosch           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "asm.h"
#include <stdlib.h>

static int		handle_open(int ac, char **av)
{
	int			fd;

	if (ac != 2)
		ft_printerr(ASMUSAGE);
	else if (ft_strequ(av[1] + (ft_strlen(av[1]) - 2), ".s") == 0)
		ft_printerr(ASMUSAGE);
	if ((fd = open(av[1], O_RDONLY)) == -1)
		ft_printerr("asm: Open failed: %s.\n", strerror(errno));
	return (fd);
}

void			final_asm_free(t_list **tab, t_list **lst, t_list **label)
{
	t_list		**save;

	ft_list_del(lst, &free_token);
	ft_list_del(label, &free_label);
	save = tab;
	while (*tab != NULL)
	{
		ft_list_del(tab, &free_token);
		tab++;
	}
	free(save);
}

int				asmcore(int ac, char **av)
{
	t_list	*token_list;
	t_list	**token_tab;
	t_list	*label;
	t_cmd	cmd;
	int		fd;

	if ((token_list = ft_list_init()) == NULL)
		ft_printerr("asm: asmcore(ft_list_init): %s\n", strerror(errno));
	if ((label = ft_list_init()) == NULL)
		ft_printerr("asm: asmcore(ft_list_init): %s\n", strerror(errno));
	fd = handle_open(ac, av);
	ft_bzero(cmd.name, PROG_NAME_LENGTH);
	ft_bzero(cmd.comment, COMMENT_LENGTH);
	cmd.name[0] = -1;
	cmd.comment[0] = -1;
	lexer(token_list, label, fd);
	token_tab = list2tab(token_list);
	parser(token_tab, label, &cmd);
	translator(token_tab, label, av[1], cmd);
	if (close(fd) == -1)
		ft_printerr("asm: Close failed: %s.\n", strerror(errno));
	final_asm_free(token_tab, &token_list, &label);
	return (EXIT_SUCCESS);
}
