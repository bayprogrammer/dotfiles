(use-package coffee-mode
  :config
  (add-hook 'coffee-mode-hook
            #'(lambda ()
                (electric-indent-local-mode -1)
                (setq-local electric-indent-mode nil)
                (setq-local coffee-indent-tabs-mode nil)
                (setq-local coffee-tab-width 2)
                (setq-local tab-stop-list '(2 4 6)))))
