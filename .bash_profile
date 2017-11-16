# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

#PATH=$PATH:$HOME/.local/bin:$HOME/bin
#export PATH

#----------------------------
# Colors imported from ~/.bashrc
#----------------------------

#----------------------------
# Prompt
#----------------------------

# This is a different and interesting prompt style.
#[working directory]
#(time)-(username)->

#PCT="\`if [[ \$EUID -eq 0 ]]; then T='$LIGHTRED' ; else T='$LIGHTBLUE'; fi; 
#echo \$T \`"
#PS1="\n$GREEN[\w] \n$DARKGRAY($PCT\t$DARKGRAY)-($PCT\u$DARKGRAY)-($PCT\!
#$DARKGRAY)$YELLOW-> $NC"
#PS1="\`if [[ \$EUID -eq 0 ]]; then PCT='$LIGHTRED';
#else PCT='$LIGHTBLUE'; fi; 
#echo '\n$GREEN[\w] \n$DARKGRAY('\$PCT'\t$DARKGRAY)-\
#('\$PCT'\u$DARKGRAY)-('\$PCT'\!$DARKGRAY)$YELLOW-> $NC'\`"


DEFAULTCOLOR="$BBlue"
PCT="\`if [[ \$EUID -eq 0 ]]; then T='$BRed' ; else T='$DEFAULTCOLOR'; fi; 
echo \$T \`"

PS1="$PCT\u$DEFAULTCOLOR@\h [\W]$ $NC"
