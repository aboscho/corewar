/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_string_del.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abaisago <adam_bai@tuta.io>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/22 15:30:05 by abaisago          #+#    #+#             */
/*   Updated: 2020/05/11 15:37:45 by abaisago         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

#include <stdlib.h>
#include <stddef.h>

/*
** The ft_string_del() function frees the pointer to t_string pointed to by
** _address_ and sets it to NULL.
**
** Does not return.
*/

void	ft_string_del(t_string **address)
{
	t_string		*string;

	string = *address;
	ft_bzero(string->buf, string->size);
	string->len = 0;
	free(string->buf);
	string->buf = NULL;
	string->size = 0;
	free(*address);
	*address = NULL;
}
