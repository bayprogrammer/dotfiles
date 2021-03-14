namespace :ubuntu do
  namespace :flatpak do
    # flatpak run org.signal.Signal
    task :signal do
      script do
        flatpak '--user', :install, '-y', 'flathub org.signal.Signal'
      end
    end
  end
end
