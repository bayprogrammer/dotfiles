(add-to-list 'auto-mode-alist '("zshrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("zprofile\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("zshenv\\'" . sh-mode))
(add-hook 'sh-mode-hook
          '(lambda ()
             (setq-local electric-indent-mode 1)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 2)
             (setq-local tab-stop-list '(2 4 6))

             (setq-local sh-basic-offset 2)
             (setq-local sh-indentation 2)))
