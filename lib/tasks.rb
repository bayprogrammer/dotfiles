tasks_dir = File.dirname(__FILE__)
tasks_glob = File.join(tasks_dir, 'tasks', '**', '*.rb')

def other_path(file)
  File.join($basedir, 'other', file)
end

def unless_exists(pathname, &block)
  block.(pathname) unless File.exists?(pathname)
end

Dir[tasks_glob].each do |task|
  require task
end
