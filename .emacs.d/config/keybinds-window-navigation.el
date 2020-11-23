;; Window navigation
;;(global-set-key (kbd "<S-up>")    'zmd-windmove-up)
;;(global-set-key (kbd "<S-down>")  'zmd-windmove-down)
;;(global-set-key (kbd "<S-left>")  'zmd-windmove-left)
;;(global-set-key (kbd "<S-right>") 'zmd-windmove-right)

(global-set-key (kbd "M-k")    'zmd-windmove-up)
(global-set-key (kbd "M-j")  'zmd-windmove-down)
(global-set-key (kbd "M-h")  'zmd-windmove-left)
(global-set-key (kbd "M-l") 'zmd-windmove-right)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-x o") 'other-window)
;; Emacs / Tmux Navigation functions inspired by
;;   https://gist.github.com/nathanlippi/5923326 and
;;   https://github.com/christoomey/vim-tmux-navigator
(defun windmove-dispatch (dir)
  (if (inside-tmux?)
      (if (emacs-switch-window dir)
          nil
        (tmux-switch-pane dir))
    (emacs-switch-window dir)))

(defun inside-tmux? ()
  (and (not (window-system))
       (getenv "TMUX" (window-frame))))

(defun tmux-switch-pane (dir)
  ;; TODO(zmd): replace with (case dir ('up...
  (cond ((eq 'up dir)    (call-process-shell-command-in-frame-environment "tmux select-pane -U"))
        ((eq 'down dir)  (call-process-shell-command-in-frame-environment "tmux select-pane -D"))
        ((eq 'left dir)  (call-process-shell-command-in-frame-environment "tmux select-pane -L"))
        ((eq 'right dir) (call-process-shell-command-in-frame-environment "tmux select-pane -R"))))

(defun emacs-switch-window (dir)
  ;; TODO(zmd): replace with (case dir ('up...
  (ignore-errors (cond ((eq 'up dir)    (windmove-up))
                       ((eq 'down dir)  (windmove-down))
                       ((eq 'left dir)  (windmove-left))
                       ((eq 'right dir) (windmove-right)))))

(defun zmd-windmove-up    () (interactive) (windmove-dispatch 'up))
(defun zmd-windmove-down  () (interactive) (windmove-dispatch 'down))
(defun zmd-windmove-left  () (interactive) (windmove-dispatch 'left))
(defun zmd-windmove-right () (interactive) (windmove-dispatch 'right))

(defun call-process-shell-command-in-frame-environment (cmd &optional in buf disp)
  (if (frame-parameter nil 'environment)
      (let ((process-environment
             (frame-parameter nil 'environment)))
        (call-process-shell-command cmd in buf disp))
    (call-process-shell-command cmd in buf disp)))
