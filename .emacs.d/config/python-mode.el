(add-hook 'python-mode-hook
          '(lambda ()
             (electric-indent-local-mode -1)
             (setq-local electric-indent-mode nil)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 4)
             (setq-local tab-stop-list '(4 8 12))))
