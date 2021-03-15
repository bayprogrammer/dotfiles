namespace :ubuntu do
  desc 'ubuntu php support'
  task php: :base do
    php_packages = %w(
      php
      php-xdebug
      phpunit
      composer
    )

    script do
      sudo :apt, :install, '-y', php_packages
    end
  end
end

