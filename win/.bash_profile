# aliases
# TODO: make some aliases...

# make ls use colors
export CLICOLOR=1
export LSCOLORS="Exfxcxdxbxegedabagacad"
alias ls='ls -Fa --color'

# define colors
C_DEFAULT="\[\033[m\]"
C_WHITE="\[\033[1m\]"
C_BLACK="\[\033[30m\]"
C_RED="\[\033[31m\]"
C_GREEN="\[\033[32m\]"
C_YELLOW="\[\033[33m\]"
C_BLUE="\[\033[34m\]"
C_PURPLE="\[\033[35m\]"
C_CYAN="\[\033[36m\]"
C_LIGHTGRAY="\[\033[37m\]"
C_DARKGRAY="\[\033[1;30m\]"
C_LIGHTRED="\[\033[1;31m\]"
C_LIGHTGREEN="\[\033[1;92m\]"
C_LIGHTYELLOW="\[\033[1;33m\]"
C_LIGHTBLUE="\[\033[1;34m\]"
C_LIGHTPURPLE="\[\033[1;35m\]"
C_LIGHTCYAN="\[\033[1;36m\]"
C_BG_BLACK="\[\033[40m\]"
C_BG_RED="\[\033[41m\]"
C_BG_GREEN="\[\033[42m\]"
C_BG_YELLOW="\[\033[43m\]"
C_BG_BLUE="\[\033[44m\]"
C_BG_PURPLE="\[\033[45m\]"
C_BG_CYAN="\[\033[46m\]"
C_BG_LIGHTGRAY="\[\033[47m\]"

# set your prompt
#export PS1="$C_LIGHTGREEN\u$C_DARKGRAY: $C_LIGHTYELLOW\w\n$C_DARKGRAY\$$C_DEFAULT "
PREV_RESULTS='`if [ $? = 0 ]; then echo "\[\e[32m\]✔ "; else echo "\[\e[31m\]✘ "; fi`'
TIMESTAMP='\[\e[1;34m\]\w'
GIT_MODIFIED='`if [[ $(git status 2> /dev/null | head -n3 | tail -n1) = "Changes to be committed:" || $(git status 2> /dev/null | head -n2 | tail -n1) = "Changes to be committed:" ]]; then echo "\[\e[33m\]"; else echo "\[\e[31m\]"; fi`'
GIT_CLEAN='`if [[ $(git status 2> /dev/null | head -n3 | tail -n1) = "nothing to commit, working directory clean" ]]; then echo "\[\e[32m\]"; fi`'
CURRENT_BRANCH='`__git_ps1 " %s"`'

export PS1=$PREV_RESULTS$TIMESTAMP$GIT_MODIFIED$GIT_CLEAN$CURRENT_BRANCH'\n\[\033[m\]$ '
PATH=/opt/local/bin:$PATH