namespace :elementary do
  # https://openresty.org/en/linux-packages.html#ubuntu
  desc 'bootstrap openresty on elementary'
  task :openresty => :base do
    openresty_packages = %w(
      wget
      gnupg
      ca-certificates
    )

    openresty_asc_src = other_path('openresty.asc')
    openresty_repo_src = other_path('openresty.list')

    script do
      sudo do
        systemctl :disable, :nginx
        systemctl :stop, :nginx

        apt :install, '-y', openresty_packages

        unless_exists('/etc/apt/trusted.gpg.d/openresty.gpg') do |openresty_asc_dest|
          sh 'apt-key', '--keyring', openresty_asc_dest, 'add', openresty_asc_src
        end

        unless_exists('/etc/apt/sources.list.d/openresty.list') do |openresty_repo_dest|
          cp openresty_repo_src, openresty_repo_dest
        end

        apt :update, '-y'
        apt :install, '-y', 'openresty'

        systemctl :disable, :openresty
        systemctl :stop, :openresty
      end
    end
  end
end
