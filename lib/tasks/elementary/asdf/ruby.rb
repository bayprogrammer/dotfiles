namespace :elementary do
  namespace :asdf do
    task :ruby do
      asdf_ruby_deps = %w(
        autoconf
        bison
        build-essential
        libdb-dev
        libffi-dev
        libgdbm-dev
        libgdbm5
        libncurses5-dev
        libreadline6-dev
        libssl-dev
        libyaml-dev
        zlib1g-dev
      )

      script do
        sudo do
          apt do
            install '-y', asdf_ruby_deps
          end
        end

        asdf = ->(*args, &block) {
          sh('~/.asdf/bin/asdf', *args, &block)
        }

        asdf.('plugin-add', :ruby, 'https://github.com/asdf-vm/asdf-ruby.git')
      end
    end
  end
end
