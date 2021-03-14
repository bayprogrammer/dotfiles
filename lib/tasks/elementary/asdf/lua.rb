namespace :elementary do
  namespace :asdf do
    task :lua do
      script do
        # TODO(zmd)
        asdf = ->(*args, &block) {
          sh('~/.asdf/bin/asdf', *args, &block)
        }

        asdf.('plugin-add', :lua, 'https://github.com/Stratus3D/asdf-lua.git')
      end
    end
  end
end
