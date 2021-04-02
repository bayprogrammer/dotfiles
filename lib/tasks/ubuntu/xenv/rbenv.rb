namespace :ubuntu do
  namespace :xenv do
    task :rbenv do
      rbenv_deps = %w(
        autoconf
        bison
        build-essential
        libssl-dev
        libyaml-dev
        libreadline6-dev
        zlib1g-dev
        libncurses5-dev
        libffi-dev
        libgdbm6
        libgdbm-dev
        libdb-dev
      )

      script do
        sudo :apt, :install, '--yes', rbenv_deps
      end

      Xenv.install('rbenv/rbenv') do |plugins|
        plugins.install('rbenv/ruby-build')
      end
    end
  end
end
