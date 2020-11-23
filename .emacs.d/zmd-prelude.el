;;; -*- lexical-binding: t -*-

(setq tls-checktrust t
      gnutls-verify-error t
      package-archives nil
      package-enable-at-startup nil
      inhibit-default-init t)

(defun zmd/expand-emacs-dir (relative-path)
  (expand-file-name relative-path user-emacs-directory))

(defun zmd/expand-emacs-dir-glob (relative-path glob)
  (file-expand-wildcards
                (expand-file-name glob
                 (concat user-emacs-directory relative-path "/"))))

(defun zmd/load-files (relative-path)
  (let ((files (zmd/expand-emacs-dir-glob relative-path "*.el")))
    (dolist (file files)
      (load file))))

(defun zmd/load-file (relative-path)
  (load (expand-file-name relative-path user-emacs-directory)))

(defun zmd/load-file-if-exists (relative-path)
  (let ((file (expand-file-name relative-path user-emacs-directory)))
    (if (file-exists-p file)
        (load file))))

(defun zmd/load-path (relative-path)
  (let ((path (zmd/expand-emacs-dir relative-path)))
    (add-to-list 'load-path path)))

(defun zmd/load-paths (relative-path)
  (let ((paths (zmd/expand-emacs-dir-glob relative-path "*")))
    (dolist (path paths)
      (add-to-list 'load-path path))))
