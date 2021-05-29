namespace :ubuntu do
  desc 'bootstrap homebrew on ubuntu'
  task brew: :base do
    base_brew_packages = %w(
      ffmpeg
      fzf
      mpv
      neovim
      rlwrap
      the_silver_searcher
      tmux
      youtube-dl
      gforth
    )

    script do
      Utils.unless_exists('/home/linuxbrew/.linuxbrew/bin/brew') do |_pathname|
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
end
