(defun my-term-mode-hook ()
  (define-key term-raw-map (kbd "M-o") #'other-window)
  (define-key term-raw-map (kbd "M-x") #'helm-M-x)
  (define-key term-mode-map (kbd "C-x C-k") #'term-char-mode)

  ;;https://stackoverflow.com/questions/2173356/how-to-switch-to-a-different-buffer-from-a-terminal-buffer/2348991#2348991
  (term-set-escape-char ?\C-x))

(add-hook 'term-mode-hook
          'my-term-mode-hook)
