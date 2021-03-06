namespace :fedora do
  desc 'bootstrap fedora'
  task :bootstrap => %w(base asdf)

  desc 'bootstrap base fedora'
  task :base do
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

