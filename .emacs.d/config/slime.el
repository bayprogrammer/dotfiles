(use-package slime
  :config
  ;; Set your lisp system and, optionally, some contribs
  (setq slime-contribs '(slime-fancy))
  (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
  (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
  (setq inferior-lisp-program "sbcl"))
