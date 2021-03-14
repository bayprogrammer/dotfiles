namespace :elementary do
  namespace :asdf do
    task :nodejs do
      asdf_node_js_deps = %w(
        curl
        dirmngr
        gawk
        gpg
      )

      script do
        sudo do
          apt do
            install '-y', asdf_node_js_deps
          end
        end

        asdf = ->(*args, &block) {
          sh('~/.asdf/bin/asdf', *args, &block)
        }

        asdf.('plugin-add', :nodejs, 'https://github.com/asdf-vm/asdf-nodejs.git')
        bash '-c', '~/.asdf/plugins/nodejs/bin/import-release-team-keyring'
      end
    end
  end
end
