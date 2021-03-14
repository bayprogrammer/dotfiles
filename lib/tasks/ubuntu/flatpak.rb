namespace :ubuntu do
  desc 'setup flatpak & apps'
  task flatpak: %w(
    base
    flatpak:setup
    flatpak:signal
    flatpak:discord
    flatpak:steam
  )
end

