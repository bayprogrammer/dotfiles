utils_dir = File.dirname(__FILE__)
utils_glob = File.join(tasks_dir, 'utils', '**', '*.rb')
Dir[utils_glob].each do |util|
  require util
end

module Utils
  def self.other_path(file)
    File.join($basedir, 'other', file)
  end

  def self.unless_exists(pathname, &block)
    block.(pathname) unless File.exists?(pathname)
  end
end
