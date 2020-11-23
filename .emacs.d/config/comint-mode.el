(defun my-comint-mode-hook ()
  ;; add this hook as buffer local, so it runs once per window.
  (if (display-graphic-p (window-frame))
      (setq-local cursor-type 'box))
  (local-unset-key (kbd "C-<up>"))
  (local-unset-key (kbd "C-<down>")))

(add-hook 'comint-mode-hook 'my-comint-mode-hook)
