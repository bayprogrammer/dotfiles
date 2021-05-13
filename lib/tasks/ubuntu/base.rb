namespace :ubuntu do
  desc 'bootstrap base ubuntu'
  task :base do
    base_packages = %w(
      build-essential
      dconf-editor
      git
      openssh-server
      rsync
      ruby

      curl
      neovim
      tmux
      xsel
      zsh
      zsh-doc
      tup

      ubuntu-restricted-extras
      gnome-shell-extension-prefs

      perl
      perl-doc
      libdevel-repl-perl
      libreply-perl
      php
      python3
      python3-doc
      ruby
      ruby2.7-doc
      nodejs
      nodejs-doc
      npm
      gauche
      gauche-doc
      guile-3.0
      guile-3.0-doc
      love
      lua5.3
      luarocks

      ubuntu-wallpapers-karmic
      ubuntu-wallpapers-lucid
      ubuntu-wallpapers-maverick
      ubuntu-wallpapers-natty
      ubuntu-wallpapers-oneiric
      ubuntu-wallpapers-precise
      ubuntu-wallpapers-quantal
      ubuntu-wallpapers-raring
      ubuntu-wallpapers-saucy
      ubuntu-wallpapers-trusty
      ubuntu-wallpapers-utopic
      ubuntu-wallpapers-vivid
      ubuntu-wallpapers-wily
      ubuntu-wallpapers-xenial
      ubuntu-wallpapers-yakkety
      ubuntu-wallpapers-zesty
      ubuntu-wallpapers-artful
      ubuntu-wallpapers-bionic
      ubuntu-wallpapers-cosmic
      ubuntu-wallpapers-disco
      ubuntu-wallpapers-eoan
    )

    script do
      sudo do
        apt :update, '-y'
        apt :upgrade, '-y'
        apt :'dist-upgrade', '-y'

        apt :install, '-y', base_packages
      end

      unless grep "'^zebdeos.*zsh$'", '/etc/passwd'
        chsh '-s', '/usr/bin/zsh'
      end
    end
  end
end
