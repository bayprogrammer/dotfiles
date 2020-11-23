(defun my-diff-mode-hook ()
  ;; add this hook as buffer local, so it runs once per window.
  (if (display-graphic-p (window-frame))
      (setq-local cursor-type 'box))
  (local-unset-key (kbd "M-o")))

(add-hook 'diff-mode-hook 'my-diff-mode-hook)
