;;; -*- lexical-binding: t -*-

(load (expand-file-name "zmd-prelude.el" user-emacs-directory))

;; ============================================================================

(zmd/load-paths "site-lisp")
(eval-when-compile (require 'use-package))

;; ============================================================================

(zmd/load-files "lisp")
(zmd/load-file "config.el")

(zmd/load-file-if-exists "init-local.el")
