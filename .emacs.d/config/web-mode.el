(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  ;;(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-quotes" . nil))
  (add-to-list 'web-mode-indentation-params '("case-extra-offset" . nil))
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-enable-auto-indentation nil)
  (setq web-mode-enable-auto-pairing nil)
  (setq web-mode-enable-auto-closing nil)
  (setq web-mode-enable-auto-quoting nil)
  (setq web-mode-style-padding 2)
  (setq web-mode-script-padding 2)
  (setq web-mode-attr-indent-offset 2)
  (add-hook 'web-mode-hook
            '(lambda()
               (electric-indent-local-mode -1)
               (setq-local electric-indent-mode nil)
               (setq-local indent-tabs-mode nil)
               (setq-local tab-width 2)
               (setq-local tab-stop-list '(2 4 6)))))