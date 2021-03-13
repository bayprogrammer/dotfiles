require 'utils/dotfiles'

namespace :dotfiles do
  namespace :install do
    desc 'install public dotfiles'
    task :pub do
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
  end
end
