#----------------------------------------------------------
# Enable color support certain commands
#----------------------------------------------------------
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#----------------------------------------------------------
# ls aliases
#----------------------------------------------------------
alias la='ls -a'           # List hidden files
alias ll='ls -l'           # List files in long format
alias lr='ls -R'           # Recursive ls
alias lx='ls -lXB'         # Sort by extension.
alias lk='ls -lSr'         # Sort by size, biggest last.
alias lt='ls -ltr'         # Sort by date, most recent last.
alias lc='ls -ltcr'        # Sort by/show change time,most recent last.
alias lu='ls -ltur'        # Sort by/show access time,most recent last.

#----------------------------------------------------------
# Tailoring 'less'
#----------------------------------------------------------
alias more='less'
export PAGER=less
export LESSCHARSET='latin1'
#export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
#:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#----------------------------------------------------------
# Add an "alert" alias for long running commands.  Use like so:
# sleep 10; alert;
#----------------------------------------------------------
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#----------------------------------------------------------
# Personal Aliases
#----------------------------------------------------------
alias netfresh='while true; do clear && netstat -aunt && sleep 5; done;'
alias q='exit'
alias sshstack1='ssh mcmay@l1elasticstack01.scbandt.com'

#-------------------------------------------------------------
# File & strings related functions:
#-------------------------------------------------------------
# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe() { find . -type f -iname '*'"${1:-}"'*' \
-exec ${2:-file} {} \;  ; }

# Find a pattern in a set of files and highlight them:
#+ (needs a recent version of egrep).
function fstr()
{
  OPTIND=1
  local mycase=""
  local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
  while getopts :it opt
  do
    case "$opt" in
      i) mycase="-i " ;;
      *) echo "$usage"; return ;;
    esac
  done
  shift $(( $OPTIND - 1 ))
  if [ "$#" -lt 1 ]; then
    echo "$usage"
    return;
  fi
  find . -type f -name "${2:-*}" -print0 | \
xargs -0 egrep --color=always -sn ${case} "$1" 2>&- | more
}

# Handy Extract Program
function extract()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1     ;;
      *.tar.gz)    tar xvzf $1     ;;
      *.bz2)       bunzip2 $1      ;;
      *.rar)       unrar x $1      ;;
      *.gz)        gunzip $1       ;;
      *.tar)       tar xvf $1      ;;
      *.tbz2)      tar xvjf $1     ;;
      *.tgz)       tar xvzf $1     ;;
      *.zip)       unzip $1        ;;
      *.Z)         uncompress $1   ;;
      *.7z)        7z x $1         ;;
      *)           echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz" "${1%%/}/";}

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1";}

# Make your directories and files access rights sane.
function sanitize() { chmod -R u=rwX,g=rX,o="$@";}

