namespace :ubuntu do
  namespace :asdf do
    task :elixir do
      asdf_elixir_deps = %w(
        unzip
      )

      script do
        sudo do
          apt do
            install '-y', asdf_elixir_deps
          end
        end

        asdf = ->(*args, &block) {
          sh('~/.asdf/bin/asdf', *args, &block)
        }

        asdf.('plugin-add', :elixir, 'https://github.com/asdf-vm/asdf-elixir.git')
      end
    end
  end
end

