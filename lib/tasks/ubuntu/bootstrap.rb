namespace :ubuntu do
  # TODO(zmd): asdf
  desc 'bootstrap elementary'
  task bootstrap: %w(
    base
    brew
  )
end

