namespace :dotfiles do
  namespace :install do
    desc 'install private dotfiles'
    task :priv do
      priv_basedir = File.join(File.expand_path('..', $basedir), 'private')
      next unless File.exists?(priv_basedir)

      priv_files = %w(.ssh .gnupg)
      Utils::Dotfiles.privatize! files: priv_files, dest: priv_basedir
      Utils::Dotfiles.install src: priv_basedir, files: priv_files

      File.chmod(0700, File.expand_path('~'))
      File.chmod(0700, File.expand_path('~/.ssh'))
      File.chmod(0700, File.expand_path('~/.gnupg'))
    end
  end
end
