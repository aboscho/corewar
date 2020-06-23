/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abaisago <adam_bai@tuta.io>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/06/23 17:15:19 by abaisago          #+#    #+#             */
/*   Updated: 2020/06/23 18:32:40 by abaisago         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef ERROR_H
# define ERROR_H

/*
** VM
*/

# define EINVEXT		"Invalid file extension, must be .cor"
# define EMANYPLAYER	"Too many players specified"
# define EMAXPLAYER		"Specified id too big, max: %d"
# define ESAMEID		"Same id for different champions forbidden"
# define USAGE			"Usage: " \
	"corewar [-dump nbr_cycles] [-n number] CHAMPION.cor [CHAMPION.cor ...]"

/*
*************
** ERROR_H **
*************
*/
#endif
