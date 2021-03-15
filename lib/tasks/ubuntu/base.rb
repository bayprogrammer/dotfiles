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

      ubuntu-restricted-extras
      gnome-shell-extension-prefs
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
