/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ldi.c                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ariperez <ariperez@student.42.fr           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/07/19 19:43:34 by ariperez          #+#    #+#             */
/*   Updated: 2020/07/19 22:52:54 by ariperez         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../../include/corewar/vm.h"

void		op_ldi(t_vm *vm, t_cursor *cursor)
{
	t_opmem		mem;
	int         addr;

	mem = (t_opmem){0};
	mem.ocp = ARENA[REGISTERS[PC] + 1];
	mem.count = 2;
	mem.type[0] = (mem.ocp & 0xc0) >> 6;
	mem.type[1] = (mem.ocp & 0x30) >> 4;
	mem.type[2] = (mem.ocp & 0x0c) >> 2;
	mem.modulo = 1;
	if ((op_is_reg(vm, cursor, &mem, 0) || op_is_dir2(vm, cursor, &mem, 0) ||
		op_is_ind(vm, cursor, &mem, 0)) &&
		(op_is_reg(vm, cursor, &mem, 1) || op_is_dir2(vm, cursor, &mem, 1)) &&
		op_is_reg(vm, cursor, &mem, 2))
	{
		addr = (mem.arg[1] + mem.arg[2]) % IDX_MOD;
		REGISTERS[mem.pos[2]] = ARENA[REGISTERS[PC] + addr + 3] << 0;
		REGISTERS[mem.pos[2]] |= ARENA[REGISTERS[PC] + addr + 2] << 8;
		REGISTERS[mem.pos[2]] |= ARENA[REGISTERS[PC] + addr + 1] << 16;
		REGISTERS[mem.pos[2]] |= ARENA[REGISTERS[PC] + addr + 0] << 24;
		cursor->carry = (REGISTERS[mem.pos[2]] ? 0 : 1);
		REGISTERS[PC] += mem.count;
	}
	else
		REGISTERS[PC]++;
}