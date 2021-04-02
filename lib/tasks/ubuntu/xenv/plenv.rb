namespace :ubuntu do
  namespace :xenv do
    task :plenv do
      plenv_deps = %w(
        build-essential
        curl
        bash
      )

      script do
        sudo :apt, :install, '--yes', plenv_deps
      end

      Xenv.install('tokuhirom/plenv') do |plugins|
        plugins.install('tokuhirom/perl-build')
      end
    end
  end
end
