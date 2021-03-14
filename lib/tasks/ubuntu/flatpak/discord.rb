namespace :ubuntu do
  namespace :flatpak do
    # flatpak run com.discordapp.Discord
    task :discord do
      script do
        flatpak '--user', :install, '-y', 'com.discordapp.Discord'
      end
    end
  end
end

