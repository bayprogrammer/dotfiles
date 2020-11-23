":"; # == Bootstrap Gauche Preamble ===========================================
":";   if ! test -f $HOME/.local/bin/gosh; then
":";     OLD_PWD=$(pwd)
":";     mkdir -p $HOME/local/dists/gauche
":";     if cd $HOME/local/dists/gauche; then
":";       if ! test -f Gauche-0.9.9.tgz; then
":";         wget http://prdownloads.sourceforge.net/gauche/Gauche-0.9.9.tgz
":";       fi
":";       if echo "ad5e15021764b733ec913cca8b77c9a53d4ee997  Gauche-0.9.9.tgz" | shasum -c - 1>/dev/null 2>&1; then
":";         tar xzf Gauche-0.9.9.tgz
":";         cd Gauche-0.9.9
":";         ./configure "--prefix=$HOME/.local"
":";         make -j
":";         make -s check
":";         make install
":";         cd $OLD_PWD
":";         exec $HOME/.local/bin/gosh "$0" -- "$@"
":";       else
":";         echo "Gauche couldn't be downloaded or verified." >&2
":";         exit 1
":";       fi
":";     fi
":";   else
":";     exec $HOME/.local/bin/gosh "$0" -- "$@"
":";   fi
":"; # == / Bootstrap Gauche Preamble =========================================

;; ----------------------------------------------------------------------------

(display "Hello, world.\n")
