namespace :ubuntu do
  namespace :xenv do
    task :pyenv do
      pyenv_deps = %w(
        make
        build-essential
        libssl-dev
        zlib1g-dev
        libbz2-dev
        libreadline-dev
        libsqlite3-dev
        wget
        curl
        llvm
        libncurses5-dev
        xz-utils
        tk-dev
        libxml2-dev
        libxmlsec1-dev
        libffi-dev
        liblzma-dev
      )

      script do
        sudo :apt, :install, '--yes', pyenv_deps
      end

      Xenv.install('pyenv/pyenv')
    end
  end
end
