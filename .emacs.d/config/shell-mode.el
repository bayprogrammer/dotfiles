(defun comint-custom-bindings ()
  ;; NOTE(zmd): comint-clear-buffer is Emacs 25+
  (define-key shell-mode-map (kbd "C-c C-c l")
    'comint-clear-buffer))
(eval-after-load 'shell '(comint-custom-bindings))

;; directory tracking via Trey Jackson's blog post, see:
;;           http://trey-jackson.blogspot.com/2008_08_01_archive.html
;; see also: https://www.emacswiki.org/emacs/ShellDirtrackByPrompt

(add-hook 'shell-mode-hook
          #'(lambda ()
              (toggle-truncate-lines 0)
              (setq-local comint-prompt-regexp "^ .* \$ $")
              ;;(display-line-numbers-mode 0)
              (shell-dirtrack-mode 0)
              (add-hook 'comint-preoutput-filter-functions
                        'shell-sync-dir-with-prompt nil t)))

(defun shell-sync-dir-with-prompt (string)
  "A preoutput filter function (see `comint-preoutput-filter-functions')
which sets the shell buffer's path to the path embedded in a prompt string.
This is a more reliable way of keeping the shell buffer's path in sync
with the shell, without trying to pattern match against all
potential directory-changing commands, ala `shell-dirtrack-mode'.

In order to work, your shell must be configured to embed its current
working directory into the prompt.  Here is an example .zshrc
snippet which turns this behavior on when running as an inferior Emacs shell:

  if [ $EMACS ]; then
     prompt='|Pr0mPT|%~|[%n@%m]%~%# '
  fi

The part that Emacs cares about is the '|Pr0mPT|%~|'
Everything past that can be tailored to your liking.
"
  (if (string-match "|Pr0mPT|\\([^|]*\\)|" string)
      (let ((cwd (match-string 1 string)))
        (setq default-directory
              (if (string-equal "/" (substring cwd -1))
                  cwd
                (setq cwd (concat cwd "/"))))
        (replace-match "" t t string 0))
    string))
