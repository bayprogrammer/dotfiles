namespace :ubuntu do
  desc 'bootstrap ubuntu'
  task bootstrap: %w(
    base
    brew
    asdf
    xenv
    flatpak
    php
    virt
    lisp
    postgresql
  )
end

