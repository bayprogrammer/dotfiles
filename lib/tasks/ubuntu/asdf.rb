namespace :ubuntu do
  desc 'install asdf-vm things for ubuntu'
  task asdf: %w(
    base
    asdf:setup
    asdf:ruby
    asdf:erlang
    asdf:elixir
    asdf:nodejs
    asdf:python
    asdf:lua
  )
end
