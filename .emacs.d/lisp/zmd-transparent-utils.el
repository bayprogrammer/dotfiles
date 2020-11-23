(defun zmd/terminal-frame-tweaks (frame)
  (unless (display-multi-frame-p frame)
    (modify-frame-parameters frame
                             '((background-color . "unspecified-bg")))))

(defun zmd/transparent-terminal ()
  "Make current frame transparent (only if it's a TTY frame)"
  (interactive)
  (zmd/terminal-frame-tweaks (window-frame)))

;; TODO(zmd): zmd/clone-theme-to-term

;; source: https://www.emacswiki.org/emacs/TransparentEmacs
(defun zmd/frame-transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque: ")
  (set-frame-parameter (selected-frame) 'alpha value))
