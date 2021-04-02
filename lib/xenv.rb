require 'fileutils'
require 'utils'

module Xenv
  class Plugins
    def initialize(normalized_dest)
      @normalized_dest = normalized_dest
    end

    def install(plugin_source)
      normalized_plugin_source = Xenv.normalize_source(plugin_source)
      normalized_plugin_dest = Xenv.normalize_dest(
        plugins_dir,
        normalized_plugin_source,
        ''
      )

      Xenv.install!(normalized_plugin_source, normalized_plugin_dest)
    end

    def plugins_dir
      dir = File.join(@normalized_dest, 'plugins')
      FileUtils.mkdir_p(dir)
      dir
    end
  end

  def self.install(source, dest='~', &block)
    normalized_source = normalize_source(source)
    normalized_dest = normalize_dest(dest, normalized_source)

    install!(normalized_source, normalized_dest)
    block.call(Plugins.new(normalized_dest)) unless block.nil?
  end

  def self.install!(normalized_source, normalized_dest)
    script do
      if File.exists?(normalized_dest)
        git '-C', normalized_dest, :pull
      else
        git :clone, normalized_source, normalized_dest
      end
    end
  end

  def self.normalize_source(source)
    github?(source) ? githubify(source) : gitify(source)
  end

  def self.normalize_dest(dest, normalized_source, prefix='.')
    expanded_dest = File.expand_path(dest)
    name = prefix + xenv_name(normalized_source)
    File.join(expanded_dest, name)
  end

  def self.github?(source)
    # It's sad, but it's true: if it's not a full URI, it's probably GitHub. We
    # should attempt to fix this.
    !( source.start_with?('https://') ||
       source.start_with?('http://') )
  end

  def self.githubify(source)
    gitify("https://github.com/#{source}")
  end

  def self.gitify(source)
    the_end = source.end_with?('.git') ? '' : '.git'
    source + the_end
  end

  def self.xenv_name(normalized_source)
    normalized_source
      .split('/')
      .last()
      .split('.')
      .first()
  end
end
