# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

#----------------------------------
# Colors
#----------------------------------
# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset


ALERT=${BWhite}${On_Red} # Bold White on red background


#----------------------------------
# Aliases
#----------------------------------
alias vi="vim"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

alias mkdir="mkdir -p"

alias path='echo -e ${PATH//:/\\n}'

alias du='du -kh'
alias df='df -kTh'

alias ls='ls -h --color'
alias lx='ls -lXB'		#	Sort by extension.
alias lk='ls -lSr'		#	Sort by size, biggest last.
alias lt='ls -ltr'		#	Sort by date, most recent last.
alias lc='ls -ltcr'		#	Sort by/show change time, most recent last.
alias lu='ls -ltur'		#	Sort by/show access time, most recent last.

alias ll="ls -lv --group-directories-first"
alias lm='ll |more'		#	Pipe through more.
alias lr='ll -R'		#	Recursive ls.
alias la='ll -A'		#	Show hidden files.
#alias tree='tree -Csuh'		#	Nice alternative to 'recursive ls' ...


#----------------------------------
# FUNCTIONS
#----------------------------------

#Create an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

#Formatted 'df' output.
function mydf()
{ 
    for fs ; do

        if [ ! -d $fs ]
        then
          echo -e $fs" :No such file or directory" ; continue
        fi

        local info=( $(command df -P $fs | awk 'END{ print $2,$3,$5 }') )
        local free=( $(command df -Pkh $fs | awk 'END{ print $4 }') )
        local nbstars=$(( 20 * ${info[1]} / ${info[0]} ))
        local out="["
        for ((j=0;j<20;j++)); do
            if [ ${j} -lt ${nbstars} ]; then
               out=$out"*"
            else
               out=$out"-"
            fi
        done
        out=${info[2]}" "$out"] ("$free" free on "$fs")"
        echo -e $out
    done
}

#Get IP address on ethernet
function my_ip()
{
	MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' |
		sed -e s/addr://)
	echo ${MY_IP:-"Not connected"}
}

# Get current host related info.
function ii()
{
	echo -e "\n${BRed}You are logged on :$NC " ; hostname
	echo -e "\n${BRed}Additional information :$NC " ; uname -a
	echo -e "\n${BRed}Users logged on :$NC " ; w -hs |
		cut -d " " -f1 | sort | uniq
	echo -e "\n${BRed}Current date :$NC " ; date
	echo -e "\n${BRed}Machine stats :$NC " ; uptime
	echo -e "\n${BRed}Memory stats :$NC " ; free
	echo -e "\n${BRed}Diskspace :$NC " ; mydf / $HOME
	echo -e "\n${BRed}Local IP Address :$NC " ; my_ip
	echo -e "\n${BRed}Open connections :$NC " ; netstat -pan --inet;
	echo
}

ii
