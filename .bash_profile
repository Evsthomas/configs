# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

#PATH=$PATH:$HOME/.local/bin:$HOME/bin
#export PATH

#----------------------------
# Temp Colors
#----------------------------
DARKGRAY='\e[1;30m'
LIGHTRED='\e[1;31m'
GREEN='\e[32m'
YELLOW='\e[1;33m'
LIGHTBLUE='\e[1;34m'
NC='\e[m'

#----------------------------
# Prompt
#----------------------------

# This is a different and interesting prompt style.
#PCT="\`if [[ \$EUID -eq 0 ]]; then T='$LIGHTRED' ; else T='$LIGHTBLUE'; fi; 
#echo \$T \`"
#PS1="\n$GREEN[\w] \n$DARKGRAY($PCT\t$DARKGRAY)-($PCT\u$DARKGRAY)-($PCT\!
#$DARKGRAY)$YELLOW-> $NC"
#PS1="\`if [[ \$EUID -eq 0 ]]; then PCT='$LIGHTRED';
#else PCT='$LIGHTBLUE'; fi; 
#echo '\n$GREEN[\w] \n$DARKGRAY('\$PCT'\t$DARKGRAY)-\
#('\$PCT'\u$DARKGRAY)-('\$PCT'\!$DARKGRAY)$YELLOW-> $NC'\`"


PCT="\`if [[ \$EUID -eq 0 ]]; then T='$BRed' ; else T='$BBlue'; fi; 
echo \$T \`"

PS1="$BBlue[\W] \n$DARKGRAY($PCT\t$DARKGRAY)-($PCT\u$DARKGRAY)-($PCT\!$DARKGRAY)$YELLOW-> $NC"

PS1="$PCT\u@$BBlue\h [\W]$ $NC"
