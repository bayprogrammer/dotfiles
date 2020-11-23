(global-set-key [mouse-4] (lambda ()
                            (interactive)
                            (scroll-down 5)))

(global-set-key [mouse-5] (lambda ()
                            (interactive)
                            (scroll-up 5)))

(global-set-key (kbd "C-c w u") 'winner-undo)
(global-set-key (kbd "C-c w r") 'winner-redo)

;; C-x C-SPC should be the same as C-x SPC
(global-set-key (kbd "C-x C-SPC") 'rectangle-mark-mode)
(global-set-key (kbd "C-x C-@") 'rectangle-mark-mode)

;; Code folding
(global-set-key (kbd "C-c -") 'hs-hide-block)
(global-set-key (kbd "C-c =") 'hs-show-block)
(global-set-key (kbd "C-c `") 'hs-toggle-hiding)

;; https://stackoverflow.com/questions/11721224/shift-arrow-selection-in-emacs#11724437
;; https://groups.google.com/forum/#!topic/gnu.emacs.help/ZGu2MNkJGrI
;; https://unix.stackexchange.com/questions/375825/how-can-emacs-be-configured-to-accept-shift-and-alt-cursor-combinations-properly/377432#377432
(defadvice terminal-init-xterm (after map-S-up-escape-sequence activate)
  (define-key input-decode-map "\e[1;2A" [S-up]))
(defadvice terminal-init-xterm (after map-S-down-escape-sequence activate)
  (define-key input-decode-map "\e[1;2B" [S-down]))
(defadvice terminal-init-xterm (after map-S-left-escape-sequence activate)
  (define-key input-decode-map "\e[1;2D" [S-left]))
(defadvice terminal-init-xterm (after map-S-right-escape-sequence activate)
  (define-key input-decode-map "\e[1;2C" [S-right]))

(defadvice terminal-init-xterm (after map-C-up-escape-sequence activate)
  (define-key input-decode-map "\e[1;5A" [C-up]))
(defadvice terminal-init-xterm (after map-C-down-escape-sequence activate)
  (define-key input-decode-map "\e[1;5B" [C-down]))
(defadvice terminal-init-xterm (after map-C-left-escape-sequence activate)
  (define-key input-decode-map "\e[1;5D" [C-left]))
(defadvice terminal-init-xterm (after map-C-right-escape-sequence activate)
  (define-key input-decode-map "\e[1;5C" [C-right]))

(defadvice terminal-init-xterm (after map-M-up-escape-sequence activate)
  (define-key input-decode-map "\e[1;3A" [M-up]))
(defadvice terminal-init-xterm (after map-M-down-escape-sequence activate)
  (define-key input-decode-map "\e[1;3B" [M-down]))
(defadvice terminal-init-xterm (after map-M-left-escape-sequence activate)
  (define-key input-decode-map "\e[1;3D" [M-left]))
(defadvice terminal-init-xterm (after map-M-right-escape-sequence activate)
  (define-key input-decode-map "\e[1;3C" [M-right]))

(defadvice terminal-init-tmux (after map-S-up-escape-sequence activate)
  (define-key input-decode-map "\e[1;2A" [S-up]))
(defadvice terminal-init-tmux (after map-S-down-escape-sequence activate)
  (define-key input-decode-map "\e[1;2B" [S-down]))
(defadvice terminal-init-tmux (after map-S-left-escape-sequence activate)
  (define-key input-decode-map "\e[1;2D" [S-left]))
(defadvice terminal-init-tmux (after map-S-right-escape-sequence activate)
  (define-key input-decode-map "\e[1;2C" [S-right]))

(defadvice terminal-init-tmux (after map-C-up-escape-sequence activate)
  (define-key input-decode-map "\e[1;5A" [C-up]))
(defadvice terminal-init-tmux (after map-C-down-escape-sequence activate)
  (define-key input-decode-map "\e[1;5B" [C-down]))
(defadvice terminal-init-tmux (after map-C-left-escape-sequence activate)
  (define-key input-decode-map "\e[1;5D" [C-left]))
(defadvice terminal-init-tmux (after map-C-right-escape-sequence activate)
  (define-key input-decode-map "\e[1;5C" [C-right]))

(defadvice terminal-init-tmux (after map-C-up-escape-sequence activate)
  (define-key input-decode-map "\e[1;3A" [M-up]))
(defadvice terminal-init-tmux (after map-M-down-escape-sequence activate)
  (define-key input-decode-map "\e[1;3B" [M-down]))
(defadvice terminal-init-tmux (after map-M-left-escape-sequence activate)
  (define-key input-decode-map "\e[1;3D" [M-left]))
(defadvice terminal-init-tmux (after map-M-right-escape-sequence activate)
  (define-key input-decode-map "\e[1;3C" [M-right]))
