namespace :elementary do
  # https://brave.com/linux/#linux
  desc 'bootstrap brave on elementary'
  task :brave => :base do
    brave_packages = %w(
      apt-transport-https
      curl
      gnupg
    )

    brave_asc_src = Utils.other_path('brave-core.asc')
    brave_repo_src = Utils.other_path('brave-browser-release.list')

    script do
      sudo do
        apt :install, '-y', brave_packages

        Utils.unless_exists('/etc/apt/trusted.gpg.d/brave-browser-release.gpg') do |brave_asc_dest|
          sh 'apt-key', '--keyring', brave_asc_dest, 'add', brave_asc_src
        end

        Utils.unless_exists('/etc/apt/sources.list.d/brave-browser-release.list') do |brave_repo_dest|
          cp brave_repo_src, brave_repo_dest
        end

        apt :update, '-y'
        apt :install, '-y', 'brave-browser'
      end
    end
  end
end
