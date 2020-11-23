(zmd/load-files "config")

;; ----------------------------------------------------------------------------

(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)

(setq ring-bell-function 'ignore
      ;;show-paren-delay 0
      auto-save-default -1
      backup-inhibited t
      winner-dont-bind-my-keys t)
(setq-default sentence-end-double-space nil
              display-time-24hr-format 1
              fill-column 79
              frame-resize-pixelwise t
              indicate-empty-lines t
              inhibit-startup-screen t
              man-width 72
              truncate-lines t
              visible-cursor nil
              x-wait-for-event-timeout nil)

(column-number-mode t)
(display-time-mode t)
(menu-bar-mode -1)
(winner-mode t)
(show-paren-mode t)
(xterm-mouse-mode t)

(defun graphic-config ()
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (fringe-mode 0)
  ;;(setq-default cursor-type '(bar . 2))
  (load-theme 'wheatgrass)
  ;;(set-face-attribute 'default nil
  ;;                    :font "DejaVu Sans Mono"
  ;;                    :height 105)
  ;;(set-face-attribute 'default nil
  ;;                    :font "-xos4-terminus-bold-*-*-*-14-*-*-*-*-*-iso10646-*")
  )
(defun tty-config ()
  ;; TODO(zmd): Hide behind a flag
  ;; === Adapted from Adam Schaefers' Spartan Emacs Tweaks: ===
  ;; TODO(zmd): set the following only when env var set
  (setq-default default-frame-alist '((tty-color-mode . never)))

  ;;(custom-set-faces '(font-lock-function-name-face ((t (:weight bold))))
  ;;                  '(font-lock-comment-face ((t (:weight normal :slant italic))))
  ;;                  '(lazy-highlight ((t (:weight bold :underline t))))
  ;;                  '(isearch ((t (:weight bold :inverse-video t))))
  ;;                  '(show-paren-match ((t (:weight bold :underline t)))))

  (setq display-time-default-load-average nil)
  (setq display-time-load-average nil)
  ;; true spartans should also uncomment the next line:
  ;;(global-font-lock-mode -1)
  ;;(transient-mark-mode -1)
  ;;(global-set-key (kbd "M-q") 'fill-region-as-paragraph)
  (setq auto-hscroll-mode 'current-line)
  ;;(setq-default mode-line-format
  ;;              '((:eval (format-mode-line "%* %H%M %b %l:%c"))))
  )

(if (display-graphic-p (window-frame))
    (graphic-config)
  ;;(tty-config)
  (load-theme 'wheatgrass)
  (setq auto-hscroll-mode 'current-line))

(add-hook 'before-save-hook
          '(lambda ()
             (delete-trailing-whitespace)))
