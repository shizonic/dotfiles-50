#!/bin/sh
#
# ufetch-debian - tiny system info for debian
#

## INFO

# user is already defined
hostname="$(hostname)"
os='Debian'
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(dpkg -l | wc -l)"
shell="$(basename ${SHELL})"
if [ -z "${WM}" ]; then
	WM="$(tail -n 1 "${HOME}/.xinitrc" | cut -d ' ' -f 2)"
fi

## DEFINE COLORS

# probably don't change these
bc="$(tput bold)"		# bold
c0="$(tput setaf 0)"	# black
c1="$(tput setaf 1)"	# red
c2="$(tput setaf 2)"	# green
c3="$(tput setaf 3)"	# yellow
c4="$(tput setaf 4)"	# blue
c5="$(tput setaf 5)"	# magenta
c6="$(tput setaf 6)"	# cyan
c7="$(tput setaf 7)"	# white
rc="$(tput sgr0)"		# reset

# you can change these
lc="${rc}${bc}${c1}"	# labels
nc="${rc}${bc}${c1}"	# user and hostname
ic="${rc}${bc}${c7}"	# info
fc="${rc}${bc}${c1}"	# first color
sc="${rc}${c1}"			# second color

## OUTPUT

cat <<EOF

${fc}    _____    ${lc}${USER}${ic}@${lc}${hostname}${rc}
${fc}   /  __ \\   ${lc}OS:        ${ic}${os}${rc}
${fc}  |  /    |  ${lc}KERNEL:    ${ic}${kernel}${rc}
${fc}  |  ${sc}\\___-   ${lc}UPTIME:    ${ic}${uptime}${rc}
${sc}  -_         ${lc}PACKAGES:  ${ic}${packages}${rc}
${sc}    --_      ${lc}SHELL:     ${ic}${shell}${rc}
${fc}             ${lc}WM:        ${ic}${WM}${rc}


EOF
