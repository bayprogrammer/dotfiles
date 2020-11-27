(use-package projectile
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'default)
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
