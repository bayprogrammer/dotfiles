namespace :elementary do
  desc 'bootstrap elementary'
  task bootstrap: %w(
    elementary:base
    elementary:brave
    elementary:openresty
    elementary:brew
    elementary:asdf
  )
end
