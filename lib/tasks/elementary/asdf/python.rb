namespace :elementary do
  namespace :asdf do
    task :python do
      asdf_python_deps = %w(
        build-essential
        curl
        libbz2-dev
        libffi-dev
        liblzma-dev
        libncurses5-dev
        libreadline-dev
        libsqlite3-dev
        libssl-dev
        libxml2-dev
        libxmlsec1-dev
        llvm
        make
        tk-dev
        wget
        xz-utils
        zlib1g-dev
      )

      script do
        sudo do
          apt do
            install '-y', asdf_python_deps
          end
        end

        asdf = ->(*args, &block) {
          sh('~/.asdf/bin/asdf', *args, &block)
        }

        asdf.('plugin-add', :python, 'https://github.com/danhper/asdf-python.git')
      end
    end
  end
end
