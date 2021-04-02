namespace :ubuntu do
  namespace :xenv do
    task :luaenv do
      Xenv.install('cehoffman/luaenv') do |plugins|
        plugins.install('cehoffman/lua-build')
      end
    end
  end
end
