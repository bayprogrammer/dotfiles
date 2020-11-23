(add-hook 'js-mode-hook
          '(lambda ()
             (electric-indent-local-mode -1)
             (setq-local electric-indent-mode nil)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 2)
             (setq-local tab-stop-list '(2 4 6))
             (setq-local js-indent-level 2)))

(add-hook 'js-jsx-mode-hook
          '(lambda ()
             (electric-indent-local-mode -1)
             (setq-local electric-indent-mode nil)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 2)
             (setq-local tab-stop-list '(2 4 6))
             (setq-local sgml-basic-offset 2)))
