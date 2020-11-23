(add-hook 'c++-mode-hook
          '(lambda ()
             (setq-local c-basic-offset 4)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 4)
             (c-set-offset 'substatement-open 0)))
