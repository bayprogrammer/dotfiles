;; Clipboard integration when running in terminal (xclip / pbcopy)
;; functions adapted from: http://stackoverflow.com/questions/3216081/integrate-emacs-copy-paste-with-system-copy-paste/24557276#24557276

(setq interprogram-cut-function 'universal-cut)
(setq interprogram-paste-function 'universal-paste)

(global-unset-key (kbd "<M-f10>"))
(defun universal-cut (text)
  (if window-system
      (gui-select-text text)
    (pipe-process-shell-command text "clipc")))

(defun universal-paste ()
  (if window-system
      (gui-selection-value)
    (shell-command-terminal-paste "clipp")))

(defun pipe-process-shell-command (text command &rest args)
  (let* ((process-connection-type nil)
         (command-proxy (apply
                         'start-process
                         (append (list "pipe-process-shell-command" nil command)
                                 args))))
    (process-send-string command-proxy text)
    (process-send-eof command-proxy)))

(defun shell-command-terminal-paste (command &rest args)
  (let* ((command (zmd/string-join (append (list command) args) " "))
         (output (shell-command-to-string command))
         (last-kill (car kill-ring)))
    (unless (string= last-kill output)
      output)))
