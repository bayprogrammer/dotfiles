(use-package markdown-mode
  :config
  (add-to-list 'auto-mode-alist '("\.md\'" . markdown-mode))
  (add-hook 'markdown-mode-hook
            '(lambda()
               (setq-local indent-tabs-mode nil)
               (setq-local tab-width 4)
               (setq-local tab-stop-list '(4 8 16)))))
