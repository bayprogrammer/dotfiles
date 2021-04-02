namespace :ubuntu do
  namespace :xenv do
    task :nodenv do
      nodenv_deps = %(
        python
        g++
        make
        python3-distutils
        ccache
      )

      script do
        sudo :apt, :install, '--yes', nodenv_deps
      end

      Xenv.install('nodenv/nodenv') do |plugins|
        plugins.install('nodenv/node-build')
      end
    end
  end
end
