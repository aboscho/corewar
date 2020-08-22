/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   add.c                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ariperez <ariperez@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/07/19 19:43:34 by ariperez          #+#    #+#             */
/*   Updated: 2020/07/19 22:52:54 by ariperez         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "vm.h"

void		op_add(t_vm *vm, t_cursor *cursor)
{
	t_opmem		m;

	m = (t_opmem){0};
	m.ocp = ARENA[(REGISTERS[PC] + 1) % MEM_SIZE];
	m.count = 2;
	m.type[0] = (m.ocp & 0xc0) >> 6;
	m.type[1] = (m.ocp & 0x30) >> 4;
	m.type[2] = (m.ocp & 0x0c) >> 2;
	if (op_is_reg(vm, cursor, &m, 0) &&
		op_is_reg(vm, cursor, &m, 1) &&
		op_is_reg(vm, cursor, &m, 2))
	{
		REGISTERS[m.pos[2]] = m.arg[0] + m.arg[1];
		cursor->carry = (REGISTERS[m.pos[2]] == 0 ? 1 : 0);
		REGISTERS[PC] += m.count;
	}
	else
		REGISTERS[PC]++;
}
