namespace :ubuntu do
  namespace :asdf do
    task :erlang do
      asdf_erlang_deps = %w(
        autoconf
        build-essential
        fop
        libgl1-mesa-dev
        libglu1-mesa-dev
        libncurses-dev
        libncurses5-dev
        libpng-dev
        libssh-dev
        libwxgtk3.0-gtk3-dev
        libxml2-utils
        m4
        openjdk-11-jdk
        unixodbc-dev
        xsltproc
      )

      script do
        sudo do
          apt do
            install '-y', asdf_erlang_deps
          end
        end

        asdf = ->(*args, &block) {
          sh('~/.asdf/bin/asdf', *args, &block)
        }

        asdf.('plugin-add', :erlang, 'https://github.com/asdf-vm/asdf-erlang.git')
      end
    end
  end
end
