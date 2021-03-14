namespace :ubuntu do
  namespace :flatpak do
    task :setup do
      script do
        Utils.unless_exists('/usr/bin/flatpak') do |_pathname|
          sudo :apt, :install, '-y', :flatpak
          flatpak '--user', 'remote-add', '--if-not-exists', :flathub, 'https://flathub.org/repo/flathub.flatpakrepo'

          puts "You ought to reboot if you just installed Flatpak."
          puts "Don't forget to re-run the bootstrap process!"
          exit 0
        end
      end
    end
  end
end
