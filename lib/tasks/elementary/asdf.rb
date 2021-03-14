namespace :elementary do
  desc 'install asdf-vm things for elementary'
  task asdf: %w(
    base
    asdf:ruby
    asdf:erlang
    asdf:elixir
    asdf:nodejs
    asdf:python
    asdf:lua
  ) do
    script do
      git :clone, 'https://github.com/asdf-vm/asdf.git', '~/.asdf', '--branch', 'v0.8.0'
    end
  end
end
