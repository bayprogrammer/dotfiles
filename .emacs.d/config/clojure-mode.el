(use-package clojure-mode
  :after clj-refactor yasnippet smartparens aggressive-indent
  :config
  (defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1)               ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m")
    (subword-mode)
    (smartparens-strict-mode)
    (aggressive-indent-mode)
    (setq-local indent-tabs-mode nil))
  (add-hook 'clojure-mode-hook #'my-clojure-mode-hook))
