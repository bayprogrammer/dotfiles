namespace :ubuntu do
  namespace :xenv do
    task :luaenv do
      Xenv.install('cehoffman/luaenv') do |plugins|
        plugins.install('cehoffman/lua-build')
        plugins.install('xpol/luaenv-luarocks')
      end
    end
  end
end
