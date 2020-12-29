
$basedir = File.expand_path('..', __FILE__)
$LOAD_PATH.prepend(File.join($basedir, 'lib'))

require 'fileutils'

require 'utils/dotfiles'
require 'utils/script'


desc "install dotfiles"
task install: %w(
  install:dotfiles:pub
  install:dotfiles:priv
)

namespace :install do
  desc "install public dotfiles"
  task "dotfiles:pub" do
    %w(ark src wrk).each do |dir|
      FileUtils.mkdir_p File.expand_path("~/#{dir}")
    end

    Utils::Dotfiles.install src: $basedir, files: %w(
      .asdfrc
      .bin
      .config
      .dircolors-mono
      .gdbinit
      .gitconfig
      .gitignore_global
      .tmux.conf
      .zprofile
      .zsh
      .zshrc
    )
  end

  desc "install private dotfiles"
  task "dotfiles:priv" do
    priv_basedir = File.join(File.expand_path('..', $basedir), 'private')
    next unless File.exists?(priv_basedir)

    priv_files = %w(.ssh .gnupg)
    Utils::Dotfiles.privatize! files: priv_files, dest: priv_basedir
    Utils::Dotfiles.install src: priv_basedir, files: priv_files
  end
end

task :bootstrap => 'bootstrap:fedora'
namespace :bootstrap do
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

  task :fedora do
    script do
      sudo do
        dnf do
          upgrade '-y'

          install '-y', %w(
            kitty
            kitty-doc
            neovim
            nodejs
            nodejs-docs
            npm
            rlwrap
            ruby
            rubygem-rake
            tig
            tmux
            tmux
            util-linux-user
            xsel
            zsh
          )

          install '-y', asdf_node_js_deps
          install '-y', asdf_ruby_deps
          install '-y', asdf_python_deps

          groupinstall '-y', 'c-development'
        end
      end

      git :clone, 'https://github.com/asdf-vm/asdf.git', '~/.asdf', '--branch', 'v0.8.0'
      asdf = ->(*args, **kwargs, &block) {
        sh('~/.asdf/bin/asdf', *args, **kwargs, &block)
      }

      asdf.('plugin-add', :nodejs, 'https://github.com/asdf-vm/asdf-nodejs.git')
      bash '-c', '~/.asdf/plugins/nodejs/bin/import-release-team-keyring'

      asdf.('plugin-add', :ruby, 'https://github.com/asdf-vm/asdf-ruby.git')

      asdf.('plugin-add', :python, 'https://github.com/danhper/asdf-python.git')

      asdf.('plugin-add', :lua, 'https://github.com/Stratus3D/asdf-lua.git')

      bash File.join($basedir, 'other', 'sdkman-install.sh')
      bash File.join($basedir, 'other', 'install-sdkman-packages.sh')

      unless grep "'^zebdeos.*zsh$'", '/etc/passwd'
        chsh '-s', '/usr/bin/zsh'
      end

      tic '-x', '-o', '~/.terminfo', File.join($basedir, 'other', 'terminfo-24bit.src')
    end
  end
end
