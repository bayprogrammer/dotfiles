namespace :ubuntu do
  desc 'install asdf-vm things for ubuntu'
  # asdf:ruby
  # asdf:nodejs
  # asdf:python
  # asdf:lua
  task asdf: %w(
    base
    asdf:setup
    asdf:erlang
    asdf:elixir
  )
end
