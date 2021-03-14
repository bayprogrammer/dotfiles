$basedir = File.expand_path('..', __FILE__)
$LOAD_PATH.prepend(File.join($basedir, 'lib'))

require 'tasks'

desc 'install dotfiles'
task install: %w(
  dotfiles:install:pub
  dotfiles:install:priv
)

desc 'bootstrap default system'
task :bootstrap => 'ubuntu:bootstrap'
