namespace :ubuntu do
  desc 'install *env things for ubuntu'
  task xenv: %w(
    base
    xenv:rbenv
    xenv:plenv
    xenv:rakuenv
    xenv:phpenv
    xenv:nodenv
    xenv:luaenv
    xenv:pyenv
  )
end

