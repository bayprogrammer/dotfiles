namespace :ubuntu do
  # https://www.postgresql.org/download/linux/ubuntu/
  desc 'bootstrap postgresql on ubuntu'
  task postgresql: :base do
    postgresql_asc_src = Utils.other_path('postgresql.asc')
    postgresql_repo_src = Utils.other_path('postgresql.list')

    muh_user = `whoami`

    script do
      sudo do
        Utils.unless_exists('/etc/apt/trusted.gpg.d/postgresql.gpg') do |postgresql_asc_dest|
          sh 'apt-key', '--keyring', postgresql_asc_dest, 'add', postgresql_asc_src
        end

        Utils.unless_exists('/etc/apt/sources.list.d/postgresql.list') do |postgresql_repo_dest|
          cp postgresql_repo_src, postgresql_repo_dest
        end

        apt :update, '-y'
        apt :install, '-y', %w(postgresql postgresql-doc libpq-dev)
      end

      Dir.chdir('/') do
        sudo('-u', 'postgres') do
          createuser muh_user, '--superuser'
          createdb muh_user
        end
      end
    end
  end
end
