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
