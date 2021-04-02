require 'fileutils'
require 'utils'
require 'xenv'

tasks_dir = File.dirname(__FILE__)
tasks_glob = File.join(tasks_dir, 'tasks', '**', '*.rb')
Dir[tasks_glob].each do |task|
  require task
end
