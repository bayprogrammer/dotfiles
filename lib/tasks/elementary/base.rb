namespace :elementary do
  desc 'bootstrap base elementary'
  task :base do
    base_packages = %w(
      build-essential
      dconf-editor
      git
      gnome-disk-utility
      gnome-terminal
      openssh-server
      rsync
      ruby

      neovim
      tmux
      xsel
      zsh
      zsh-doc
    )

    xwinwrap_packages = %w(
      build-essential
      libx11-dev
      libxext-dev
      libxrender-dev
      x11proto-xext-dev
      xorg-dev
    )

    script do
      sudo do
        apt :update, '-y'
        apt :upgrade, '-y'
        apt :'dist-upgrade', '-y'

        apt :install, '-y', base_packages
        apt :install, '-y', xwinwrap_packages
      end

      unless grep "'^zebdeos.*zsh$'", '/etc/passwd'
        chsh '-s', '/usr/bin/zsh'
      end
    end
  end
end
