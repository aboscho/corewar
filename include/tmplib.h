/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   tmplib.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abosch <abosch@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/07/11 14:54:42 by abosch            #+#    #+#             */
/*   Updated: 2020/07/14 14:47:43 by abosch           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef TMPLIB_H
# define TMPLIB_H

# include "libft.h"

void	ft_string_nappend(t_string *string, const char *text, size_t n);
int		ft_strisnumber(const char *s);
int		ft_list_count(t_list *list);

#endif
