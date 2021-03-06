$basedir = File.expand_path('..', __FILE__)
$LOAD_PATH.prepend(File.join($basedir, 'lib'))

require 'fileutils'

require 'utils/dotfiles'
require 'utils/script'


def other_path(file)
  File.join($basedir, 'other', file)
end

def unless_exists(pathname, &block)
  block.(pathname) unless File.exists?(pathname)
end

desc 'install dotfiles'
task install: %w(
  install:dotfiles:pub
  install:dotfiles:priv
)

namespace :install do
  desc 'install public dotfiles'
  task 'dotfiles:pub' do
    %w(ark src wrk).each do |dir|
      FileUtils.mkdir_p File.expand_path("~/#{dir}")
    end

    Utils::Dotfiles.install src: $basedir, files: %w(
      .asdfrc
      .bin
      .config
      .local
      .dircolors-mono
      .gdbinit
      .gitconfig
      .gitignore_global
      .manpath
      .tmux.conf
      .zprofile
      .zsh
      .zshrc
    )
  end

  desc 'install private dotfiles'
  task 'dotfiles:priv' do
    priv_basedir = File.join(File.expand_path('..', $basedir), 'private')
    next unless File.exists?(priv_basedir)

    priv_files = %w(.ssh .gnupg)
    Utils::Dotfiles.privatize! files: priv_files, dest: priv_basedir
    Utils::Dotfiles.install src: priv_basedir, files: priv_files

    File.chmod(0700, File.expand_path('~'))
    File.chmod(0700, File.expand_path('~/.ssh'))
    File.chmod(0700, File.expand_path('~/.gnupg'))
  end
end

desc 'bootstrap default system'
task :bootstrap => 'bootstrap:elementary'

namespace :bootstrap do
  desc 'bootstrap elementary'
  task :elementary => %w(
    elementary:base
    elementary:brave
    elementary:openresty
    elementary:brew
    elementary:asdf
  )

  namespace :elementary do
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

    base_brew_packages = %w(
      ffmpeg
      fzf
      mpv
      neovim
      tmux
      youtube-dl
      the_silver_searcher
    )

    xwinwrap_packages = %w(
      build-essential
      libx11-dev
      libxext-dev
      libxrender-dev
      x11proto-xext-dev
      xorg-dev
    )

    brave_packages = %w(
      apt-transport-https
      curl
      gnupg
    )

    openresty_packages = %w(
      wget
      gnupg
      ca-certificates
    )

    asdf_node_js_deps = %w(
      curl
      dirmngr
      gawk
      gpg
    )

    asdf_ruby_deps = %w(
      autoconf
      bison
      build-essential
      libdb-dev
      libffi-dev
      libgdbm-dev
      libgdbm5
      libncurses5-dev
      libreadline6-dev
      libssl-dev
      libyaml-dev
      zlib1g-dev
    )

    asdf_python_deps = %w(
      build-essential
      curl
      libbz2-dev
      libffi-dev
      liblzma-dev
      libncurses5-dev
      libreadline-dev
      libsqlite3-dev
      libssl-dev
      libxml2-dev
      libxmlsec1-dev
      llvm
      make
      tk-dev
      wget
      xz-utils
      zlib1g-dev
    )

    asdf_erlang_deps = %w(
      autoconf
      build-essential
      fop
      libgl1-mesa-dev
      libglu1-mesa-dev
      libncurses-dev
      libncurses5-dev
      libpng-dev
      libssh-dev
      libwxgtk3.0-gtk3-dev
      libxml2-utils
      m4
      openjdk-11-jdk
      unixodbc-dev
      xsltproc
    )

    asdf_elixir_deps = %w(
      unzip
    )

    desc 'bootstrap base elementary'
    task :base do
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

    # https://brave.com/linux/#linux
    desc 'bootstrap brave on elementary'
    task :brave => :base do
      brave_asc_src = other_path('brave-core.asc')
      brave_repo_src = other_path('brave-browser-release.list')

      script do
        sudo do
          apt :install, '-y', brave_packages

          unless_exists('/etc/apt/trusted.gpg.d/brave-browser-release.gpg') do |brave_asc_dest|
            sh 'apt-key', '--keyring', brave_asc_dest, 'add', brave_asc_src
          end

          unless_exists('/etc/apt/sources.list.d/brave-browser-release.list') do |brave_repo_dest|
            cp brave_repo_src, brave_repo_dest
          end

          apt :update, '-y'
          apt :install, '-y', 'brave-browser'
        end
      end
    end

    # https://openresty.org/en/linux-packages.html#ubuntu
    desc 'bootstrap openresty on elementary'
    task :openresty => :base do
      openresty_asc_src = other_path('openresty.asc')
      openresty_repo_src = other_path('openresty.list')

      script do
        sudo do
          systemctl :disable, :nginx
          systemctl :stop, :nginx

          apt :install, '-y', openresty_packages

          unless_exists('/etc/apt/trusted.gpg.d/openresty.gpg') do |openresty_asc_dest|
            sh 'apt-key', '--keyring', openresty_asc_dest, 'add', openresty_asc_src
          end

          unless_exists('/etc/apt/sources.list.d/openresty.list') do |openresty_repo_dest|
            cp openresty_repo_src, openresty_repo_dest
          end

          apt :update, '-y'
          apt :install, '-y', 'openresty'
        end
      end
    end

    desc 'bootstrap signal on elementary'
    task :signal => :base do
      signal_asc_src = other_path('signal.asc')
      signal_repo_src = other_path('signal-xenial.list')

      script do
        sudo do
          unless_exists('/etc/apt/trusted.gpg.d/signal-xenial.gpg') do |signal_asc_dest|
            sh 'apt-key', '--keyring', signal_asc_dest, 'add', signal_asc_src
          end

          unless_exists('/etc/apt/sources.list.d/signal-xenial.list') do |signal_repo_dest|
            cp signal_repo_src, signal_repo_dest
          end

          apt :update, '-y'
          apt :install, '-y', 'signal-desktop'
        end
      end
    end

    desc 'bootstrap homebrew on elementary'
    task :brew => :base do
      script do
        unless_exists('/home/linuxbrew/.linuxbrew/bin/brew') do |_pathname|
          bash(File.join($basedir, 'other', 'install-homebrew.sh'))
          puts "You ought to reboot if you just installed Homebrew."
          puts "Don't forget to re-run the bootstrap process!"
          exit 0
        end

        brew :update
        brew :upgrade
        brew :install, base_brew_packages
      end
    end

    desc 'install asdf-vm things for elementary'
    task :asdf => :base do
      script do
        sudo do
          apt do
            install '-y', asdf_node_js_deps
            install '-y', asdf_ruby_deps
            install '-y', asdf_python_deps
            install '-y', asdf_erlang_deps
            install '-y', asdf_elixir_deps
          end
        end

        git :clone, 'https://github.com/asdf-vm/asdf.git', '~/.asdf', '--branch', 'v0.8.0'
        asdf = ->(*args, &block) {
          sh('~/.asdf/bin/asdf', *args, &block)
        }

        asdf.('plugin-add', :ruby, 'https://github.com/asdf-vm/asdf-ruby.git')

        asdf.('plugin-add', :erlang, 'https://github.com/asdf-vm/asdf-erlang.git')
        asdf.('plugin-add', :elixir, 'https://github.com/asdf-vm/asdf-elixir.git')

        asdf.('plugin-add', :nodejs, 'https://github.com/asdf-vm/asdf-nodejs.git')
        bash '-c', '~/.asdf/plugins/nodejs/bin/import-release-team-keyring'

        asdf.('plugin-add', :python, 'https://github.com/danhper/asdf-python.git')

        asdf.('plugin-add', :lua, 'https://github.com/Stratus3D/asdf-lua.git')
      end
    end
  end

  desc 'bootstrap fedora'
  task :fedora => %w(
    fedora:base
    fedora:asdf
  )

  namespace :fedora do
    base_packages = %w(
      chicken
      chicken-libs
      elixir
      erlang
      fira-code-fonts
      fossil
      fzf
      gauche
      godot
      guile22
      haskell-platform
      love
      lua
      minisign
      neovim
      nodejs
      nodejs-docs
      npm
      python3
      python3-docs
      python3-pip
      python3-virtualenv
      rlwrap
      ruby
      ruby
      ruby-doc
      rubygem-bundler
      rubygem-rake
      rubygems
      slib
      sqlite
      tig
      tmux
      tmux
      util-linux-user
      xsel
      zsh
    )

    # dnf group list --ids
    base_groups = %w(
      c-development
      development-tools
    )

    asdf_node_js_deps = %w(curl dirmngr gpg)

    asdf_ruby_deps = %w(
      gcc
      make
      bzip2
      openssl-devel
      libyaml-devel
      libffi-devel
      readline-devel
      zlib-devel
      gdbm-devel
      ncurses-devel
    )

    asdf_python_deps = %w(
      make
      gcc
      zlib-devel
      bzip2
      bzip2-devel
      readline-devel
      sqlite
      sqlite-devel
      openssl-devel
      tk-devel
      libffi-devel
    )

    asdf_erlang_deps = %w(
      autoconf
      ncurses-devel
      wxGTK3-devel wxBase3
      openssl-devel
      java-1.8.0-openjdk-devel
      libiodbc
      unixODBC-devel.x86_64
      erlang-odbc.x86_64
      libxslt
      fop
    )

    asdf_elixir_deps = %w(
      unzip
    )

    desc 'bootstrap base fedora'
    task :base do
      script do
        sudo do
          dnf do
            upgrade '-y'
            install '-y', base_packages
            groupinstall '-y', base_groups
          end
        end

        flatpak 'remote-add', '--if-not-exists flathub', 'https://flathub.org/repo/flathub.flatpakrepo'
        flatpak :install, '-y', :flathub, 'org.signal.Signal'

        unless grep "'^zebdeos.*zsh$'", '/etc/passwd'
          chsh '-s', '/usr/bin/zsh'
        end

        tic '-x', '-o', '~/.terminfo', File.join($basedir, 'other', 'terminfo-24bit.src')
      end
    end

    desc 'install asdf-vm things for fedora'
    task 'asdf' do
      script do
        sudo do
          dnf do
            install '-y', asdf_node_js_deps
            install '-y', asdf_ruby_deps
            install '-y', asdf_python_deps
            install '-y', asdf_erlang_deps
            install '-y', asdf_elixir_deps
          end
        end

        git :clone, 'https://github.com/asdf-vm/asdf.git', '~/.asdf', '--branch', 'v0.8.0'
        asdf = ->(*args, &block) {
          sh('~/.asdf/bin/asdf', *args, &block)
        }

        asdf.('plugin-add', :ruby, 'https://github.com/asdf-vm/asdf-ruby.git')

        asdf.('plugin-add', :erlang, 'https://github.com/asdf-vm/asdf-erlang.git')
        asdf.('plugin-add', :elixir, 'https://github.com/asdf-vm/asdf-elixir.git')

        asdf.('plugin-add', :nodejs, 'https://github.com/asdf-vm/asdf-nodejs.git')
        bash '-c', '~/.asdf/plugins/nodejs/bin/import-release-team-keyring'

        asdf.('plugin-add', :python, 'https://github.com/danhper/asdf-python.git')

        asdf.('plugin-add', :lua, 'https://github.com/Stratus3D/asdf-lua.git')
      end
    end

    desc 'install sublime things for fedora'
    task 'sublime:install' do
      script do
        sudo do
          rpm '-v', '--import', 'https://download.sublimetext.com/sublimehq-rpm-pub.gpg'
          dnf 'config-manager', '--add-repo', 'https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo'
          dnf :install, '-y', %w(sublime-text sublime-merge)
        end
      end
    end

    desc 'uninstall sublime things from fedora'
    task 'sublime:uninstall' do
      script do
        sudo do
          dnf :remove, '-y', %w(sublime-text sublime-merge)
          rm '-rf', '/etc/yum.repos.d/sublime-text.repo'
        end

      end

      rm_rf = ->(file_path) { FileUtils.rm_rf(File.expand_path(file_path)) }
      rm_rf.('~/.config/sublime-merge')
      rm_rf.('~/.config/sublime-text-3')
    end

    desc 'install optional jvm things for fedora'
    task 'fedora:jvm:install' => :fedora do
      local_bin = File.expand_path('~/.local/bin')
      FileUtils.mkdir_p(local_bin)

      script do
        bash other_path('sdkman-install.sh')
        bash other_path('install-sdkman-packages.sh')

        unless_exists(File.join(local_bin, 'clj')) do |_pathname|
          bash(
            File.join($basedir, 'other', 'clojure_linux-install-1.10.1.763.sh'),
            '--prefix',
            '~/.local'
          )
        end

        unless_exists(File.join(local_bin, 'lein')) do |lein_destination|
          curl '-fLo', lein_destination, 'https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein'
          chmod 'u+x', lein_destination
          bash lein_destination
        end

        unless_exists(File.join(local_bin, 'cs')) do |coursier_destination|
          curl '-fLo', coursier_destination, 'https://git.io/coursier-cli-linux'
          chmod 'u+x', coursier_destination
          bash(File.join($basedir, 'other', 'coursier-setup.sh'))
        end
      end
    end

    desc 'remove optional jvm things from fedora'
    task 'jvm:uninstall' do
      rm_rf = ->(file_path) { FileUtils.rm_rf(File.expand_path(file_path)) }

      %w(
        ~/.android
        ~/.cache/coursier
        ~/.groovy
        ~/.java
        ~/.lein
        ~/.sdkman
        ~/.scala_history_jline3
        ~/.local/bin/clj
        ~/.local/bin/clojure
        ~/.local/bin/cs
        ~/.local/bin/lein
        ~/.local/lib/clojure
        ~/.local/share/coursier
        ~/.local/share/man/man1/clj.1
        ~/.local/share/man/man1/clojure.1
      ).each(&rm_rf)
    end
  end
end
