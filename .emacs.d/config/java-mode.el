(add-hook 'java-mode-hook
          '(lambda ()
             (setq-local electric-indent-mode 1)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 4)
             (setq-local tab-stop-list '(4 8 16))
             (setq-local c-basic-offset 4)))
