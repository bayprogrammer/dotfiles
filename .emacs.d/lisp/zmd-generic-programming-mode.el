(define-derived-mode zmd/generic-programming-mode fundamental-mode "BayProg"
  "Major mode for editing languages for which we have no better mode for."
  (set (make-local-variable 'indent-line-function) 'tab-to-tab-stop)
  (electric-indent-local-mode -1)
  (setq-local electric-indent-mode nil)
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 2)
  (setq-local tab-stop-list '(2 4 6)))
