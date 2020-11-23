# Source: https://gist.github.com/elucify/c7ccfee9f13b42f11f81#file-gistfile1-txt
RESTORE=$(echo -en '%{\033[0m%}')
BOLD=$(echo -en '%{\033[1m%}')

if [[ $COLOR_PREFERENCE = "color" ]]; then
  BLACK=$(echo -en '%{\033[00;30m%}')
  RED=$(echo -en '%{\033[00;31m%}')
  GREEN=$(echo -en '%{\033[00;32m%}')
  YELLOW=$(echo -en '%{\033[00;33m%}')
  BLUE=$(echo -en '%{\033[00;34m%}')
  MAGENTA=$(echo -en '%{\033[00;35m%}')
  PURPLE=$(echo -en '%{\033[00;35m%}')
  CYAN=$(echo -en '%{\033[00;36m%}')
  WHITE=$(echo -en '%{\033[00;37m%}')

  LBLACK=$(echo -en '%{\033[00;90m%}')
  LRED=$(echo -en '%{\033[00;91m%}')
  LGREEN=$(echo -en '%{\033[00;92m%}')
  LYELLOW=$(echo -en '%{\033[00;93m%}')
  LBLUE=$(echo -en '%{\033[00;94m%}')
  LMAGENTA=$(echo -en '%{\033[00;95m%}')
  LPURPLE=$(echo -en '%{\033[00;95m%}')
  LCYAN=$(echo -en '%{\033[00;96m%}')
  LWHITE=$(echo -en '%{\033[00;97m%}')
else
  BLACK=
  RED=
  GREEN=
  YELLOW=
  BLUE=
  MAGENTA=
  PURPLE=
  CYAN=
  WHITE=

  LBLACK=
  LRED=
  LGREEN=
  LYELLOW=
  LBLUE=
  LMAGENTA=
  LPURPLE=
  LCYAN=
  LWHITE=
fi
