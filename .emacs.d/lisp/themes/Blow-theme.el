(deftheme Blow
  "Created 2017-12-02.")

(let ((foreground "tan")
      (background "gray16")
      (white "#ffffff")
      (yellow "yellow")
      (pink "RosyBrown1")
      (red "red1")
      (blue "SteelBlue4")
      (blue-2 "DeepSkyBlue4")
      (blue-3 "RoyalBlue3")
      (orange "dark orange")
      (cyan "cyan")
      (dark-green "darkseagreen2")
      (light-green "PaleGreen")
      (bright-green "lawn green")
      (drab-green "olive drab")
      (khaki "khaki")
      (gray "grey70")
      (medium-gray "dark gray")
      (slightly-less-dark-gray "gray30")
      (dark-gray "gray10"))
  (custom-theme-set-faces
   'Blow
   `(cursor
     ((t (:background ,dark-green))))
   `(escape-glyph
     ((t (:foreground ,cyan))))
   `(minibuffer-prompt
     ((t (:foreground ,foreground))))
   `(highlight
     ((t (:inherit lazy-highlight))))
   `(show-paren-match
     ((t (:background ,blue-2))))
   `(region
     ((t (:background ,blue-2))))
   `(shadow
     ((t (:foreground ,gray))))
   `(secondary-selection
     ((t (:background ,blue))))
   `(trailing-whitespace
     ((t (:foreground ,background
          :background ,red))))
   `(font-lock-builtin-face
     ((t (:foreground ,orange))))
   `(font-lock-comment-delimiter-face
     ((t (:foreground ,yellow
          :inherit (font-lock-comment-face)))))
   `(font-lock-comment-face
     ((t (:foreground ,yellow))))
   `(font-lock-constant-face
     ((t (:foreground ,bright-green))))
   `(font-lock-doc-face
     ((t (:inherit (font-lock-string-face)))))
   `(font-lock-function-name-face
     ((t (:weight bold
          :foreground ,white))))
   `(font-lock-keyword-face
     ((t (:foreground ,orange))))
   `(font-lock-negation-char-face
     ((t nil)))
   `(font-lock-preprocessor-face
     ((t (:inherit (font-lock-builtin-face)))))
   `(font-lock-regexp-grouping-backslash
     ((t (:inherit (bold)))))
   `(font-lock-regexp-grouping-construct
     ((t (:inherit (bold)))))
   `(font-lock-string-face
     ((t (:foreground ,medium-gray))))
   `(font-lock-type-face
     ((t (:foreground ,light-green  ;; not sure about next two lines...
          ;;:underline (:color foreground-color :style line)
          :weight bold))))
   `(font-lock-variable-name-face
     ((t (:foreground ,white))))
   `(font-lock-warning-face
     ((t (:inherit (error)))))
   `(button
     ((t (:inherit (link)))))
   `(link
     ((t (:underline (:color foreground-color
                      :style line)
          :foreground ,cyan))))
   `(link-visited
     ((t (:foreground "violet"))))
   `(fringe
     ((t (:background ,dark-gray
          :foreground ,foreground))))
   `(header-line
     ((default (:background ,background
                :foreground ,foreground))))
   `(tooltip
     ((t (:inherit (variable-pitch)
          :foreground ,background
          :background ,foreground))))
   `(mode-line
     ((t (:inverse-video nil
          :foreground ,background
          :background ,foreground))))
   `(mode-line-buffer-id
     ((t (:weight bold))))
   `(mode-line-emphasis
     ((t (:weight bold))))
   `(mode-line-highlight
     ((t nil)))
   `(mode-line-inactive
     ((t (:weight bold
          :foreground ,foreground
          :background ,slightly-less-dark-gray
          :inherit (mode-line)))))
   `(isearch
     ((t (:foreground ,background
          :background ,khaki))))
   `(isearch-fail
     ((t (:foreground ,red))))
   `(lazy-highlight
     ((t (:foreground ,yellow
          :background ,drab-green))))
   `(match
     ((t (:background ,blue-3))))
   `(next-error
     ((t (:inherit (region)))))
   `(query-replace
     ((t (:inherit (isearch)))))
   `(default
      ((t (;;:width normal
           ;;:height 98
           ;;:weight normal
           ;;:slant normal
           :underline nil
           :overline nil
           :strike-through nil
           :box nil
           :inverse-video nil
           :foreground ,foreground
           :background ,background
           :stipple nil
           :inherit nil))))
   `(scroll-bar
     ((t (:background ,background))))
   `(term-color-black
     ((t (:foreground ,background :background ,background))))
   `(term-color-red
     ((t (:foreground ,red :background ,background))))
   `(term-color-green
     ((t (:foreground ,light-green :background ,background))))
   `(term-color-yellow
     ((t (:foreground ,yellow :background ,background))))
   `(term-color-blue
     ((t (:foreground ,blue :background ,background))))
   `(term-color-magenta
     ((t (:foreground ,pink :background ,background))))
   `(term-color-cyan
     ((t (:foreground ,cyan :background ,background))))
   `(term-color-white
     ((t (:foreground ,white :background ,background))))
   `(helm-selection
     ((t (:inherit region))))
   `(helm-selection-line
     ((t (:inherit helm-selection))))
   `(helm-source-header
     ((t (:foreground ,yellow :background ,drab-green))))
   `(helm-ff-denied
     ((t (:inherit default))))
   `(helm-ff-directory
     ((t (:inherit default))))
   `(helm-ff-dirs
     ((t (:inherit default))))
   `(helm-ff-dotted-directory
     ((t (:inherit default))))
   `(helm-ff-dotted-symlink-directory
     ((t (:inherit default))))
   `(helm-ff-executable
     ((t (:inherit default))))
   `(helm-ff-file
     ((t (:inherit default))))
   `(helm-ff-invalid-symlink
     ((t (:inherit default))))
   `(helm-ff-pipe
     ((t (:inherit default))))
   `(helm-ff-prefix
     ((t (:inherit default))))
   `(helm-ff-socket
     ((t (:inherit default))))
   `(helm-ff-suid
     ((t (:inherit default))))
   `(helm-ff-symlink
     ((t (:inherit default))))
   `(helm-ff-truename
     ((t (:inherit default))))
   `(helm-files-faces
     ((t (:inherit default))))
   ))

(provide-theme 'Blow)
