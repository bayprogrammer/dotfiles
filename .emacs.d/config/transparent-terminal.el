(add-hook 'after-make-frame-functions 'zmd/terminal-frame-tweaks)
(add-hook 'window-setup-hook
          (lambda () (zmd/terminal-frame-tweaks (window-frame))))
