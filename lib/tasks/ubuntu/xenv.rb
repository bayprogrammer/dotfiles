namespace :ubuntu do
  desc 'install *env things for ubuntu'
  # xenv:rbenv
  # xenv:nodenv
  # xenv:luaenv
  # xenv:pyenv
  task xenv: %w(
    base
    xenv:phpenv
    xenv:plenv
    xenv:rakuenv
  )
end

