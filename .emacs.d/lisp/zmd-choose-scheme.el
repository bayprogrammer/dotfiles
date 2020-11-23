(defun zmd/choose-scheme (choice)
  (interactive
   (let ((completion-ignore-case t))
     (list (completing-read "Choose a scheme:" '("gosh -i" "scheme" "racket" "guile") nil t))))
  (setq scheme-program-name choice))
