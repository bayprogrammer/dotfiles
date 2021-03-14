require 'fileutils'

module Utils
  module Dotfiles
    def self.install(files:, src:, dest: '~')
      dest = File.expand_path(dest)
      FileUtils.mkdir_p(dest)

      dirs, files = files
        .map { |file| src_dest(file, src, dest) }
        .partition { |src, dest| File.directory?(src) }

      install_files(files)
      install_dirs(dirs)
    end

    def self.src_dest(file, src, dest)
      [File.join(src, file), File.join(dest, file)]
    end

    def self.install_files(files)
      files.each do |src, dest|
        dest_dir = File.dirname(dest)
        FileUtils.mkdir_p(dest_dir)
        FileUtils.ln_sf(src, dest)
      end
    end

    def self.install_dirs(dirs)
      dirs.each do |src, dest|
        FileUtils.mkdir_p(dest)
        install(files: Dir.glob('*', base: src), src: src, dest: dest)
      end
    end

    def self.privatize!(files:, dest: '~')
      files.each do |file|
        fdest = File.join(File.expand_path(dest), file)
        FileUtils.chmod_R "go=", fdest
        FileUtils.chmod_R "u=rwX", fdest
      end
    end
  end
end
