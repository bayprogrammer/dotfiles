
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
  task :fedora do
    script do
      sudo do
        dnf do
          upgrade '-y'

          install '-y', %w(
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
            kitty
            kitty-doc
          )

          groupinstall '-y', 'c-development'
        end
      end

      unless grep "'^zebdeos.*zsh$'", '/etc/passwd'
        chsh '-s', '/usr/bin/zsh'
      end

      tic '-x', '-o', '~/.terminfo', File.join($basedir, 'other', 'terminfo-24bit.src')
    end
  end
end
