/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   game.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abaisago <adam_bai@tuta.io>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/07/31 17:29:34 by abaisago          #+#    #+#             */
/*   Updated: 2020/07/31 17:36:11 by abaisago         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "vm.h"

#include "debug.h"

static void		remove_dead_cursors(t_vm *vm)
{
	ft_list_remove_if(vm->cursors, cursor_life, vm, cursor_del);
}

static void		update_stats(t_vm *vm)
{
	if (STATS.live > NBR_LIVE || STATS.check == MAX_CHECKS)
	{
		STATS.cycdie -= CYCLE_DELTA;
		STATS.check = 0;
	}
	STATS.check++;
	STATS.cycle = 0;
	STATS.live = 0;
}

static void		update_cursors(t_vm *vm)
{
	ft_printf("IN\n");
	ft_list_iter(vm->cursors, cursor_update, vm);
	ft_printf("END\n");
}

void			show_winner(t_vm *vm)
{
	ft_printf("Player %d ", STATS.last_live_id);
	ft_printf("(%s) won\n", PLAYERS[STATS.last_live_id - 1].header.prog_name);
}

void			play_game(t_vm *vm)
{
	while (CURSORS->head != NULL
		&& (!(FLAGS & F_DUMP) || STATS.cycle != SETTINGS.cycdump))
	{
		if (STATS.cycle_total == SETTINGS.cycdump)
			break;
		if (STATS.cycle == STATS.cycdie)
		{
			remove_dead_cursors(vm);
			update_stats(vm);
		}
		ft_printf("OUT\n");
		update_cursors(vm);
		++STATS.cycle;
		++STATS.cycle_total;
		/* ft_printf("%d : cycdie = %d\n", CURSORS->len, STATS.cycdie); */
	}
	if (FLAGS & F_DUMP)
		arena_print(ARENA, 32);
}
