source $HOME/.zsh/utils.sh

if [[ "$zprofile_ran" ]]; then
  export PATH="$ZPATH"
  return 0
else
  export zprofile_ran=true
fi

# -- core path setup ----------------------------------------------------------

PATH="$HOME/.bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# -- environment-based settings -----------------------------------------------

export VISUAL="nvim"
export EDITOR=$VISUAL

export QUOTING_STYLE=literal
export HOMEBREW_NO_ANALYTICS="homebrew analytics are unwelcome here"

# -- *env style version manager's exported environment vars -------------------

xenv_exports phpenv
xenv_exports nodenv
xenv_exports plenv
xenv_exports rakuenv
xenv_exports rbenv
xenv_exports pyenv
xenv_exports luaenv

# -- homebrew on linux --------------------------------------------------------

# desperate times call for desperate measures
[[ -x /home/linuxbrew/.linuxbrew/bin/brew ]] && \
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# -- sandbox affordances ------------------------------------------------------

if [ -e /usr/share/icons ]; then
  if [ $XCURSOR_PATH ]; then
    export XCURSOR_PATH="$XCURSOR_PATH:/usr/share/icons"
  else
    export XCURSOR_PATH="/usr/share/icons"
  fi
fi

# -- local-only zsh env var intialization overrides ---------------------------

[ -x $HOME/.zprofile.local ] && source $HOME/.zprofile.local

# -- export computed path -----------------------------------------------------

export PATH
export ZPATH="$PATH"
