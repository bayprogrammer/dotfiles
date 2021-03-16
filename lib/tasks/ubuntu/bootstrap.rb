namespace :ubuntu do
  desc 'bootstrap ubuntu'
  task bootstrap: %w(
    base
    brew
    asdf
    flatpak
    php
    virt
    lisp
  )
end

