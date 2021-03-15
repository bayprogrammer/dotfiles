namespace :ubuntu do
  desc 'setup flatpak & apps'
  task :flatpak do
    flatpaks = %w(
      org.chromium.Chromium
      com.discordapp.Discord
      org.gnome.Epiphany
      org.signal.Signal
      com.valvesoftware.Steam
    )

    script do
      Utils.unless_exists('/usr/bin/flatpak') do |_pathname|
        sudo :apt, :install, '-y', :flatpak
        flatpak '--user', 'remote-add', '--if-not-exists', :flathub, 'https://flathub.org/repo/flathub.flatpakrepo'

        puts "You ought to reboot if you just installed Flatpak."
        puts "Don't forget to re-run the bootstrap process!"
        exit 0
      end

      flatpaks.each do |pak|
        flatpak '--user', :install, '-y', pak
      end
    end
  end
end
