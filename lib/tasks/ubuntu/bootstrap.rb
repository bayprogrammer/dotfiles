namespace :ubuntu do
  desc 'bootstrap ubuntu'
  task bootstrap: %w(
    base
    brew
    flatpak
    php
    virt
    lisp
    postgresql
    openresty
  )
end

