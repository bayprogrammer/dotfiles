
command_available() {
  which $1 1>/dev/null 2>&1
}

path_contains() {
  echo $PATH | grep $1 1>/dev/null 2>&1
}

mkdir_if_absent() {
  if [ -d $1 ]; then
    return 1
  else
    mkdir -p $1
  fi
}

rm_if_present() {
  if [ -e $1 -o -L $1 ]; then
    rm -rf $1
  else
    return 1
  fi
}

user_in_group() {
  user=$1
  group=$2
  groups $user | grep $group 1>/dev/null
}

group_exists() {
  grep $1 /etc/group 1>/dev/null
}

add_user_to_group() {
  user=$1
  group=$2
  if ! user_in_group $user $group; then
    sudo usermod -aG $group $user
  else
    return 1
  fi
}

xenv_is_new_pyenv() {
  if [[ "$1" == "pyenv" ]]; then
    pyenv help init | grep -q -- '--path'
  else
    return 1
  fi
}

xenv_init_exports() {
  if xenv_is_new_pyenv $1; then
    eval "$($1 init --path)"
  else
    eval "$($1 init - | grep '^export')"
  fi
}

xenv_exports() {
  if command_available $1; then
    xenv_init_exports $1
  elif [[ -d $HOME/.$1/bin ]]; then
    PATH="$HOME/.$1/bin:$PATH"
    xenv_init_exports $1
  fi
}

xenv_interactive() {
  if command_available $1 && [[ "$1" == "pyenv" ]]; then
    eval "$($1 init -)"
  elif command_available $1; then
    eval "$($1 init - | grep -v '^export')"
  fi
}

color_reset="$(printf "\033[0m")"
color_black="$(printf "\033[30m")"
color_bright_black="$(printf "\033[30;1m")"
color_red="$(printf "\033[31m")"
color_bright_red="$(printf "\033[31;1m")"
color_green="$(printf "\033[32m")"
color_bright_green="$(printf "\033[32;1m")"
color_yellow="$(printf "\033[33m")"
color_bright_yellow="$(printf "\033[33;1m")"
color_blue="$(printf "\033[34m")"
color_bright_blue="$(printf "\033[34;1m")"
color_magenta="$(printf "\033[35m")"
color_bright_magenta="$(printf "\033[35;1m")"
color_cyan="$(printf "\033[36m")"
color_bright_cyan="$(printf "\033[36;1m")"
color_white="$(printf "\033[37m")"
color_bright_white="$(printf "\033[37;1m")"

about_to_do() {
  msg="$@"
  echo "${color_bright_blue}${msg}${color_reset}"
}

done_did() {
  msg="$@"
  echo "${color_green}${msg}${color_reset}"
}

did_done() {
  msg="$@"
  echo "${color_yellow}${msg}${color_reset}"
}

whoopsidaisy() {
  msg="$@"
  echo "${color_bright_red}${msg}${color_reset}"
}

do_stuff() {
  msg=$1
  shift
  cmd=$1
  shift
  about_to_do "$msg"
  $cmd $@
}

maybe_do_stuff() {
  msg=$1
  shift
  condition=$1
  shift
  cmd=$1
  if [ "$condition" = "YES" ]; then
    about_to_do "$msg"
    $cmd $@
  fi
}

do_with_style() {
  if [ "x$TERM" != "xdumb" ]; then
    printf $color_cyan
    $@
    printf $color_reset
  else
    $@
  fi
}

clone_if_missing() {
  # TODO(zmd): implement
  :
}

go_away() {
  [ "$ALREADY_SHRUGGED" ] && return 0

  whoopsidaisy "Running this giant mish mash of madness is a bad idea."
  whoopsidaisy "Are you absolutely, POSITIVILY, *certain* you wish to proceed? [y|N]"
  echo ""
  read -a dummy
  echo ""
  case $dummy in
    "y"|"Y")
      export ALREADY_SHRUGGED=YES
      echo ""
      whoopsidaisy "You were warned..."
      echo ""
      whoopsidaisy "¯\_(ツ)_/¯"
      echo ""
      sleep 2
      ;;
    *)
      echo ""
      do_stuff "Wise decision!" exit 0
      ;;
  esac
}
