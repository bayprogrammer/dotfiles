(use-package erlang
  :config
  (let ((where-erlang-is
         (if (eq system-type 'darwin)
             "/usr/local/lib/erlang"
           "/usr/lib/erlang")))
    (setq erlang-root-dir where-erlang-is)
    (setq exec-path (cons (concat where-erlang-is "/bin") exec-path))
    (require 'erlang-start)))
