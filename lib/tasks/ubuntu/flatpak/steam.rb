namespace :ubuntu do
  namespace :flatpak do
    # flatpak run com.valvesoftware.Steam
    task :steam do
      script do
        flatpak '--user', :install, '-y', 'com.valvesoftware.Steam'
      end
    end
  end
end
