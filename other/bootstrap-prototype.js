/* prototype of usage of script system used in Rakefile but for JavaScript

   non-functional - scriptz.js not yet implemented

   TODO(zmd):
     - add seamless remote usage (utilizing ssh)
     - add helpers for remote copying
     - in ruby, sh('cmd', 'arg') and sh.helper() can be implemented (where sh
       as object provides helper functionality which is not part of shell
       execution context, like dotfiles installer type stuff, or ssh, or
       something) -- easier to do in js (since js is a lisp-1, vs. ruby being a
       lisp-2)
*/

task('dotfiles:pub', () => {
  Utils.Dotfiles.install({src: basedir, files: [
    '.asdfrc',
    '.bin',
    '.config',
    '.local',
    '.dircolors-mono',
    '.gdbinit',
    '.gitconfig',
    '.gitignore_global',
    '.manpath',
    '.tmux.conf',
    '.zprofile',
    '.zsh',
    '.zshrc'
  ]})
})

namespace('bootstrap', () => {
  namespace('elementary', () => {
    const basePackages = [
      'build-essential',
      'dconf-editor',
      'git',
      'gnome-disk-utility',
      'gnome-terminal',
      'openssh-server',
      'rsync',
      'ruby',

      'neovim',
      'tmux',
      'xsel',
      'zsh',
      'zsh-doc'
    ]

    xwinwrapPackages = [
      'build-essential',
      'libx11-dev',
      'libxext-dev',
      'libxrender-dev',
      'x11proto-xext-dev',
      'xorg-dev'
    ]

    task('base', () => {
      script(() => {
        sudo((sh) => {
          apt(() => {
            update('-y')
            upgrade('-y')
            sh('dist-upgrade', '-y')

            install('-y', basePackages)
            install('-y', xwinwrapPackages)
          })
        })

        chsh('-s', '/usr/bin/zsh')
      })
    })
  })
})
