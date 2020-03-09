# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    cache_clean.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ksemele <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/14 18:46:59 by ksemele           #+#    #+#              #
#    Updated: 2020/03/03 19:20:10 by chnikia          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash
# ---------------------------- Variables of colors --------------------------- #
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'
# -------------- this restrict create .DS_Store in your account -------------- #
# ------------------------------ on network drives --------------------------- #
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
printf "${yel}mCreating '.DS_Store' on Network Stores is ${red}OFF${end}\n"
# -------------------------------- on USB drives ----------------------------- #
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
printf "${yel}Creating '.DS_Store' on USB is ${red}OFF${end}\n"
# ------------------------- Cleaning from ".DS_Store" ------------------------ #
if [ -z '((find ~/ -name ".DS_Store" 2>/dev/null))' ]
then
	    printf "${red}'.DS_Store' not find! Nothing to be done.${end}\n"
	else
		    find ~/  -name ".DS_Store" 2>/dev/null -exec rm {} \;  -print
		fi
		# --------------------------- Cleaning from "Icon?" -------------------------- #
		if [ -z '((find ~/ -name "Icon?" 2> /dev/null))' ]
		then
			    printf "${red}'Icon?'' not find! Nothing to be done.${end}\n"
			else
				    find ~/  -name "Icon?" 2>/dev/null -exec rm {} \;  -print
					printf "${grn}'.DS_Store' & 'Icon?' delete! && not create${end}\n" 2>/dev/null
				fi
				du -sh ~/Library/
				# ------------------------ Cleaning from "*42_cache*" ------------------------ #
				if [ -z '((find ~/Library -name "*42_cache*" 2>/dev/null))' ]
				then
					    printf "${red}Cache is empty! Nothing to be done.${end}\n"
					else
						    rm -rf ~/Library/*42_cache* 2> /dev/null
							    printf "${cyn}Complite. Cache is empty!${end}\n" 2>/dev/null
							fi
