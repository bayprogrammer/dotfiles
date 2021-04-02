namespace :ubuntu do
  namespace :xenv do
    task :phpenv do
      # https://github.com/php-build/php-build/blob/master/install-dependencies.sh#L30
      phpenv_deps = %w(
        autoconf2.13
        autoconf2.64
        autoconf
        bash
        bison
        build-essential
        ca-certificates
        curl
        findutils
        git
        libbz2-dev
        libcurl4-gnutls-dev
        libicu-dev
        libjpeg-dev
        libmcrypt-dev
        libonig-dev
        libpng-dev
        libreadline-dev
        libsqlite3-dev
        libssl-dev
        libtidy-dev
        libxml2-dev
        libxslt1-dev
        libzip-dev
        pkg-config
        re2c
        zlib1g-dev
      )

      script do
        sudo :apt, :install, '--yes', phpenv_deps
      end

      Xenv.install('phpenv/phpenv') do |plugins|
        plugins.install('php-build/php-build')
      end
    end
  end
end
