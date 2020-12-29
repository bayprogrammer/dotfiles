source $HOME/.zsh/utils.sh

# zsh settings for interactive shells =========================================

# has internal guard to ensure this is no-op if .zprofile already loaded
source $HOME/.zprofile

# -- detect os ----------------------------------------------------------------

OS=$(uname)

# -- local pre config ---------------------------------------------------------

[ -x $HOME/.zshrc.pre.local ] && source $HOME/.zshrc.pre.local
[ $COLOR_PREFERENCE ] || COLOR_PREFERENCE=color
source $HOME/.zsh/colors.sh

# -- zsh-specific settings ----------------------------------------------------

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -e

autoload -Uz compinit

setopt appendhistory \
       autocd \
       extended_glob \
       numeric_glob_sort \
       rm_star_silent \
       nomatch \
       prompt_subst \
       no_beep \
       automenu \
       list_ambiguous \
       inc_append_history \
       hist_ignore_dups \
       hist_find_no_dups \
       hist_lex_words

unsetopt beep notify

unset -f command_not_found_handle 2>/dev/null
unset -f command_not_found_handler 2>/dev/null

zstyle :compinstall filename '/home/zebdeos/.zshrc'
zstyle ':completion:*' menu select

# iTerm2 + ZSH + Tmux == pain for pasting into terminal. Ugh!
#
# see: https://stackoverflow.com/questions/33452870/tmux-bracketed-paste-mode-issue-at-command-prompt-in-zsh-shell#33456330
#
# Let's do it wrong, shall we?
(( $+TMUX )) && unset zle_bracketed_paste

# -- personal autloaded functions ---------------------------------------------

# Add my personal function dir to the fpath and autoload anything I
# have in there
fpath=( ~/.zsh/zfunc "${fpath[@]}" )
if [[ -d ~/.zsh/zfunc ]]; then
  for fun in ~/.zsh/zfunc/*; do
    autoload -Uz $(basename "$fun")
  done
fi

# -- tmux stuff ---------------------------------------------------------------

reuptmux  # relies on autloaded function, see above

# -- aliases ------------------------------------------------------------------

alias be="bundle exec"
alias r="rails"
alias m="mix"
alias rt="reuptmux"
alias emacs="TERM=xterm-24bit emacs -nw"
alias e="TERM=xterm-24bit emacsclient -ca '' -nw"

if [ z"$OS" = z"Linux" ]; then
  # Happy days!
  alias l="ls --color=always -F"
  alias ls="ls --color=always -F"
  alias ll="ls --color=always -Fl"
  alias la="ls --color=always -Fa"
  alias lla="ls --color=always -Fla"
  alias lal="ls --color=always -Fla"
elif [ z"$OS" = z"Darwin" ]; then
  # Sigh.......
  if [ -x /usr/local/bin/gls ]; then
    alias l="/usr/local/bin/gls --color=always -F"
    alias ls="/usr/local/bin/gls --color=always -F"
    alias ll="/usr/local/bin/gls --color=always -Fl"
    alias la="/usr/local/bin/gls --color=always -Fa"
    alias lla="/usr/local/bin/gls --color=always -Fla"
    alias lal="/usr/local/bin/gls --color=always -Fla"
  else
    alias l="ls -F"
    alias ls="ls -F"
    alias ll="ls -Fl"
    alias la="ls -Fa"
    alias lla="ls -Fla"
    alias lal="ls -Fla"
  fi
fi

# -- terminal-specific handling -----------------------------------------------

# for the likes of gnome-terminal and mate-terminal
[[ $TERM == xterm ]] && export TERM="xterm-256color"

# -- set prompt ---------------------------------------------------------------

last_status_prompt() {
  if [[ "$1" == "0" || -z "$1" ]]; then
    echo "${GREEN}:)${RESTORE}"
  else
    echo "${RED}${BOLD}:(${RESTORE}"
  fi
}

last_status_num() {
  local num=$1
  if [[ "$num" == "0" || -z "$num" ]]; then
    echo ""
  else
    echo "${RED}$num${RESTORE} "
  fi
}

last_status_lambda() {
  local num=$1
  if [[ "$num" == "0" || -z "$num" ]]; then
    echo "${GREEN}${BOLD}%(#.#.λ)${RESTORE}"
  else
    echo "${RED}${BOLD}%(#.#.λ)${RESTORE}"
  fi
}

active_jobs_prompt() {
  # using subshell necessary: http://unix.stackexchange.com/questions/251868/jobs-wc-getting-weird-return-values
  local njobs=$( (jobs) | grep '^\[' | wc -l )
  njobs=${njobs// /}
  if [[ $njobs -gt 0 ]]; then
    echo "${YELLOW}(${LYELLOW}${njobs}${YELLOW})${RESTORE} "
  fi
}

dirstack_depth_prompt() {
  local depth=$(( $(dirs -v | wc -l) -1 ))
  if [[ $depth -gt 0 ]]; then
    while [[ $depth != 0 ]]; do
      echo -n "|"
      depth="$(( $depth - 1 ))"
    done
  fi
}

git_status_prompt() {
  local git_status=$(git status 2>&1)
  if echo "$git_status" | grep -i 'Not a git' 1>/dev/null 2>&1; then
    # not a git repo
    echo "${LBLACK}%%${RESTORE}"
  elif echo "$git_status" | grep -i 'working tree clean' 1>/dev/null 2>&1; then
    # clean
    echo "${GREEN}${BOLD}=${RESTORE}"
  elif echo "$git_status" | grep -i 'to be committed' 1>/dev/null 2>&1; then
    # changes to be committed
    echo "${YELLOW}${BOLD}+${RESTORE}"
  else
    # dirty
    echo "${RED}${BOLD}?${RESTORE}"
  fi
}

PROMPT_HOSTNAME="%m"
#if hostname -s | grep '\-alpha$' >/dev/null; then
#  PROMPT_HOSTNAME=$(hostname -s |sed -e 's/-alpha$/\/alpha/')
#fi

if [[ $INSIDE_EMACS ]]; then
  if [[ $TERM == "eterm-color" ]]; then
    INSIDE_EMACS=eterm
  elif [[ $TERM == "screen" ]]; then
    INSIDE_EMACS=screen
  else
    INSIDE_EMACS=dumb
  fi
fi

if [[ $INSIDE_EMACS != "dumb" ]]; then
  # https://unix.stackexchange.com/questions/70764/get-zsh-to-report-directory-to-emacs/70826#70826
  if [ -n "$INSIDE_EMACS" ]; then
    chpwd() {
      print -P "\032/$(pwd)"
    }
  fi
fi

EMACS_DIRTRACK_PROMPT=""
if [[ $INSIDE_EMACS == "dumb" ]]; then
  EMACS_DIRTRACK_PROMPT="|Pr0mPT|%~|"
fi

complex_prompt() {
  local last_status=$?
  local statusface="$(last_status_prompt $last_status)"
  local statusnum="$(last_status_num $last_status)"
  local statuslambda="$(last_status_lambda $last_status)"
  local jobs="$(active_jobs_prompt)"
  local depth="$(dirstack_depth_prompt)"
  local git="$(git_status_prompt)"

  # λ   %1~   %0~
  PROMPT="${EMACS_DIRTRACK_PROMPT} ${jobs}${git} ${BLUE}${depth}${BOLD}%1~${RESTORE} $statuslambda "
  if [[ $INSIDE_EMACS != "dumb" ]]; then
    RPROMPT="${statusface} ${statusnum}${BLUE}%n${MAGENTA}@${CYAN}${PROMPT_HOSTNAME}${RESTORE}"
  fi
}

#simpler_prompt() {
#  local last_status=$?
#  local statusface="$(last_status_prompt $last_status)"
#  local jobs="$(active_jobs_prompt)"
#  local depth="$(dirstack_depth_prompt)"
#
#  PROMPT="${EMACS_DIRTRACK_PROMPT}${statusface} ${jobs}${depth}%1~ %(#.#.$) "
#}

precmd() {
  complex_prompt
}

# -- emacs shell-mode ---------------------------------------------------------

if [[ $INSIDE_EMACS == "dumb" ]]; then
  export TERM="xterm-256color"
  unsetopt zle

  export PAGER=cat
  export VISUAL=ed
  export EDITOR=ed
  export MANPAGER=cat
  export NODE_NO_READLINE=1
fi

# -- other color overrides ----------------------------------------------------

if [[ $COLOR_PREFERENCE == "color" ]]; then
  export FZF_DEFAULT_OPTS="--color=bw"
  dircolors_file="$HOME/.dircolors"
else
  dircolors_file="$HOME/.dircolors-mono"
fi

# -- dircolors ----------------------------------------------------------------

# intentionally below emacs shell hacks

if [ -e "$dircolors_file" ]; then
  if which dircolors 1>/dev/null 2>&1; then
    eval "$(dircolors -b "$dircolors_file")"
  elif which gdircolors 1>/dev/null 2>&1; then
    eval "$(gdircolors -b "$dircolors_file")"
  fi
fi

# -- asdf (not of the common lisp variety) integration ------------------------

if [ -e $HOME/.asdf ]; then
  . $HOME/.asdf/asdf.sh
fi
fpath=($HOME/.asdf/completions $fpath)

# -- sdkman -------------------------------------------------------------------

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

# -- clipboard integration ----------------------------------------------------
# adapted from: http://unix.stackexchange.com/questions/51933/zsh-copy-and-paste-like-emacs/51938#51938

x-copy-region-as-kill () {
  zle copy-region-as-kill
  print -rn $CUTBUFFER | clipc
}
zle -N x-copy-region-as-kill

x-kill-region () {
  zle kill-region
  print -rn $CUTBUFFER | clipc
}
zle -N x-kill-region

x-kill-line () {
  zle kill-line
  print -rn $CUTBUFFER | clipc
}
zle -N x-kill-line

x-yank () {
  CUTBUFFER=$(clipp)
  zle yank
}
zle -N x-yank

bindkey -e '\ew' x-copy-region-as-kill
bindkey -e '^W' x-kill-region
bindkey -e '^K' x-kill-line
bindkey -e '^Y' x-yank
bindkey -e '^V' x-yank

bindkey -e '^[[1~' beginning-of-line
bindkey -e '^[[4~' end-of-line
bindkey -e '^[[3~' delete-char

bindkey -e '^[[H' beginning-of-line
bindkey -e '^[[F' end-of-line

bindkey -e '^[[1;5D' backward-word
bindkey -e '^[[1;5C' forward-word

# -- local-only zsh interactive shell setup overrides -------------------------

[ -x $HOME/.zshrc.local ] && source $HOME/.zshrc.local

compinit  # run compinit after any additional completion paths have been added

return 0  # make sure initial status before first prompt is true
