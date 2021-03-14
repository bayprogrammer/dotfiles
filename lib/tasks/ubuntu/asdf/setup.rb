namespace :ubuntu do
  namespace :asdf do
    task :setup do
      script do
        git :clone, 'https://github.com/asdf-vm/asdf.git', '~/.asdf', '--branch', 'v0.8.0'
      end
    end
  end
end
