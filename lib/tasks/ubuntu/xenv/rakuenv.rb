namespace :ubuntu do
  namespace :xenv do
    task :rakuenv do
      Xenv.install('skaji/rakuenv')
    end
  end
end
