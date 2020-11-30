(use-package clojure-mode
  :config
  (defun my-clojure-mode-hook ()
    (subword-mode)
    (setq-local indent-tabs-mode nil))
  (add-hook 'clojure-mode-hook #'my-clojure-mode-hook))
