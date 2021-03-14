namespace :elementary do
  desc 'bootstrap signal on elementary'
  task :signal => :base do
    signal_asc_src = other_path('signal.asc')
    signal_repo_src = other_path('signal-xenial.list')

    script do
      sudo do
        unless_exists('/etc/apt/trusted.gpg.d/signal-xenial.gpg') do |signal_asc_dest|
          sh 'apt-key', '--keyring', signal_asc_dest, 'add', signal_asc_src
        end

        unless_exists('/etc/apt/sources.list.d/signal-xenial.list') do |signal_repo_dest|
          cp signal_repo_src, signal_repo_dest
        end

        apt :update, '-y'
        apt :install, '-y', 'signal-desktop'
      end
    end
  end
end
