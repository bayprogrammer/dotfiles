(require 'eieio)

(defclass zmd/package-info ()
  ((name :initarg :name
         :initform ""
         :type string
         :custom string
         :documentation "The package name.")
   (ref :initarg :ref
        :initform ""
        :type string
        :custom string
        :documentation "The package branch or tag reference.")
   (upstream :initarg :upstream
             :initform ""
             :type string
             :custom string
             :documentation "The package upstream source location.")
   (hashref :initarg :hashref
            :initform ""
            :type string
            :custom string
            :documentation "The hash reference to the exact commit vendored.")
   (date :initarg :date
         :initform ""
         :type string
         :custom string
         :documentation "The date the current version (ref/hashref) was audited and vendored."))
   "A class for tracking packages I'm manually auditing and vendoring.")

(setq zmd/site-lisp
      (list (zmd/package-info :name     "clojure-mode"
                              :ref      "5.9.1"
                              :upstream "https://github.com/clojure-emacs/clojure-mode.git"
                              :hashref  "e8d6414043dc063d16598dc951c1ba8168738265"
                              :date     "")

            (zmd/package-info :name     "dracula-theme"
                              :ref      "v1.7.0"
                              :upstream "https://github.com/dracula/emacs.git"
                              :hashref  "7751d4d3115c5e873b73b670248c49ce8910997e"
                              :date     "")

            (zmd/package-info :name     "doom-themes"
                              :ref      "v2.1.6"
                              :upstream "https://github.com/hlissner/emacs-doom-themes.git"
                              :hashref  "39e6971e81181b86a57f65cd0ea31376203a9756"
                              :date     "")

            (zmd/package-info :name     "elixir-mode"
                              :ref      "v2.3.2"
                              :upstream "https://github.com/elixir-editors/emacs-elixir.git"
                              :hashref  "c548a84e69787bcd04e0821351009c4448c96cac"
                              :date     "")

            (zmd/package-info :name     "kaolin-themes"
                              :ref      "v1.6.1"
                              :upstream "https://github.com/ogdenwebb/emacs-kaolin-themes.git"
                              :hashref  "1114a8d84b60eaf8cadb628a29e0eaf6b5906f69"
                              :date     "")

            ;; $ mkdir -p ./epl/
            ;; $ rm -rf ./epl/*
            ;; $ rm -rf ~/.emacs.d/site-lisp/epl
            ;; $ cp -rp ~/src/emacs-packages/epl/{*,.*~*.git} ./epl/
            ;; $ pushd ../../ ; rake install ; popd
            (zmd/package-info :name     "epl"
                              :ref      "0.9"
                              :upstream "https://github.com/cask/epl.git"
                              :hashref  "fd906d3f92d58ecf24169055744409886ceb06ce"
                              :date     "Thu Nov 26 07:30:22 AM PST 2020")

            (zmd/package-info :name     "gotham-theme"
                              :ref      "master"
                              :upstream "https://depp.brause.cc/gotham-theme.git"
                              :hashref  "a549cd031859e24fd37a779323e1542aefe86d43"
                              :date     "")

            (zmd/package-info :name     "gruber-darker-theme"
                              :ref      "master"
                              :upstream "https://github.com/rexim/gruber-darker-theme.git"
                              :hashref  "7f95ce96079eb22b9214435ed25c5af98f60b482"
                              :date     "")

            (zmd/package-info :name     "inf-clojure"
                              :ref      "v3.0.0"
                              :upstream "https://github.com/clojure-emacs/inf-clojure.git"
                              :hashref  "2c8e46b584be71fe1a585c9072da86382710dc59"
                              :date     "")

            (zmd/package-info :name     "inf-elixir"
                              :ref      "master"
                              :upstream "https://github.com/rolandtritsch/inf-elixir.git"
                              :hashref  "1d1a3fa374a53d0f6a2d67214d167aac6cb2bb5f"
                              :date     "")

            (zmd/package-info :name     "inf-ruby"
                              :ref      "master"
                              :upstream "https://github.com/nonsequitur/inf-ruby.git"
                              :hashref  "b0124578db09b64902c8ca981b02e74bec92ef36"
                              :date     "")

            (zmd/package-info :name     "lfe-mode"
                              :ref      "develop"
                              :upstream "https://github.com/rvirding/lfe.git"
                              :hashref  "d8818317f5dad0eadb51160389591a5081fa062c"
                              :date     "")

            (zmd/package-info :name     "macrostep"
                              :ref      "master"
                              :upstream "https://github.com/joddie/macrostep.git"
                              :hashref  "424e3734a1ee526a1bd7b5c3cd1d3ef19d184267"
                              :date     "")

            (zmd/package-info :name     "monokai-theme"
                              :ref      "master"
                              :upstream "https://github.com/oneKelvinSmith/monokai-emacs.git"
                              :hashref  "791baae69b02ee007cde779a80abc1a6b5962cf7"
                              :date     "")

            (zmd/package-info :name     "nord-theme"
                              :ref      "v0.5.0"
                              :upstream "https://github.com/arcticicestudio/nord-emacs.git"
                              :hashref  "0f5295f99005a200191ce7b660e56cd0510cf710"
                              :date     "")

            (zmd/package-info :name     "erlang"
                              :ref      "OTP-23.1.4"
                              :upstream "https://github.com/erlang/otp.git"
                              :hashref  "f48399440e07199f89e589ac91bc866651264298"
                              :date     "")

            ;; $ mkdir -p ./pkg-info/
            ;; $ rm -rf ./pkg-info/*
            ;; $ rm -rf ~/.emacs.d/site-lisp/pkg-info
            ;; $ cp -rp ~/src/emacs-packages/pkg-info/{*,.*~*.git} ./pkg-info/
            ;; $ pushd ../../ ; rake install ; popd
            (zmd/package-info :name     "pkg-info"
                              :ref      "master"
                              :upstream "https://github.com/emacsorphanage/pkg-info"
                              :hashref  "76ba7415480687d05a4353b27fea2ae02b8d9d61"
                              :date     "Thu Nov 26 07:30:22 AM PST 2020")

            (zmd/package-info :name     "seti-theme"
                              :ref      "master"
                              :upstream "https://github.com/caisah/seti-theme.git"
                              :hashref  "9d76db0b91d4f574dd96ac80fad41da35bffa109"
                              :date     "")

            (zmd/package-info :name     "slime"
                              :ref      "v2.26"
                              :upstream "https://github.com/slime/slime.git"
                              :hashref  "v2.26"
                              :date     "")

            (zmd/package-info :name     "solarized-theme"
                              :ref      "master"
                              :upstream "https://github.com/bbatsov/solarized-emacs.git"
                              :hashref  "92dcca5537fe8e3ce8a10885ef23ead4d151d9d7"
                              :date     "")

            (zmd/package-info :name     "spacemacs-theme"
                              :ref      "master"
                              :upstream "https://github.com/nashamri/spacemacs-theme.git"
                              :hashref  "1f5b03254de6bfa9645711f2b79781f5cca8d203"
                              :date     "")

            ;; $ mkdir -p ./use-package/
            ;; $ rm -rf ./use-package/*
            ;; $ rm -rf ~/.emacs.d/site-lisp/use-package
            ;; $ cp -rp ~/src/emacs-packages/use-package/{*,.*~*.git} ./use-package/
            ;; $ pushd ../../ ; rake install ; popd
            (zmd/package-info :name     "use-package"
                              :ref      "2.4.1"
                              :upstream "https://github.com/jwiegley/use-package.git"
                              :hashref  "caa92f1d64fc25480551757d854b4b49981dfa6b"
                              :date     "Thu Nov 26 06:58:30 AM PST 2020")

            (zmd/package-info :name     "web-mode"
                              :ref      "v17"
                              :upstream "https://github.com/fxbois/web-mode.git"
                              :hashref  "d115f8dc3052e5779938d782d9cdaa4533ef20ff"
                              :date     "")

            (zmd/package-info :name     "zenburn-theme"
                              :ref      "v2.7.0"
                              :upstream "https://github.com/bbatsov/zenburn-emacs.git"
                              :hashref  "3e00f0e2e6202dd61216e2cb967c1da6a62e9a8d"
                              :date     "")

            ;; $ mkdir -p ./async/
            ;; $ rm -rf ./async/*
            ;; $ rm -rf ~/.emacs.d/site-lisp/async
            ;; $ cp -rp ~/src/emacs-packages/async/{*,.*~*.git} ./async/
            ;; $ pushd ../../ ; rake install ; popd
            (zmd/package-info :name     "async"
                              :ref      "v1.9.4"
                              :upstream "https://github.com/jwiegley/emacs-async.git"
                              :hashref  "67c369555de998eaabd60056dead038c6c50b8fd"
                              :date     "Thu Nov 26 09:35:09 AM PST 2020")

            ;; $ mkdir -p ./dash/
            ;; $ rm -rf ./dash/*
            ;; $ rm -rf ~/.emacs.d/site-lisp/dash
            ;; $ cp -rp ~/src/emacs-packages/dash/{*,.*~*.git} ./dash/
            ;; $ pushd ../../ ; rake install ; popd
            (zmd/package-info :name     "dash"
                              :ref      "2.17.0"
                              :upstream "https://github.com/magnars/dash.el.git"
                              :hashref  "721436b04da4e2795387cb48a98ac6de37ece0fd"
                              :date     "Thu Nov 26 08:18:39 AM PST 2020")

            ;; $ mkdir -p ./queue/
            ;; $ rm -rf ./queue/*
            ;; $ rm -rf ~/.emacs.d/site-lisp/queue
            ;; $ cp -rp ~/src/emacs-packages/queue/{COPYING,README} ./queue/
            ;; $ cp -rp ~/src/emacs-packages/queue/packages/queue/* ./queue/
            ;; $ pushd ../../ ; rake install ; popd
            (zmd/package-info :name     "queue"
                              :ref      "master"
                              :upstream "https://git.savannah.gnu.org/git/emacs/elpa.git"
                              :hashref  "7b0fb2b9964a768412e6fc8dd98fface41e1d11a"
                              :date     "Thu Nov 26 08:40:09 AM PST 2020")

            ;; $ mkdir -p ./s/
            ;; $ rm -rf ./s/*
            ;; $ rm -rf ~/.emacs.d/site-lisp/s
            ;; $ cp -rp ~/src/emacs-packages/s/{*,.*~*.git} ./s/
            ;; $ pushd ../../ ; rake install ; popd
            (zmd/package-info :name     "s"
                              :ref      "1.12.0"
                              :upstream "https://github.com/magnars/s.el.git"
                              :hashref  "43ba8b563bee3426cead0e6d4ddc09398e1a349d"
                              :date     "Thu Nov 26 08:31:27 AM PST 2020")

            ;; $ mkdir -p ./a/
            ;; $ rm -rf ./a/*
            ;; $ rm -rf ~/.emacs.d/site-lisp/a
            ;; $ cp -rp ~/src/emacs-packages/a/{*,.*~*.git} ./a/
            ;; $ pushd ../../ ; rake install ; popd
            (zmd/package-info :name     "a"
                              :ref      "master"
                              :upstream "https://github.com/plexus/a.el.git"
                              :hashref  "d0490619d374fbda20eb5fb6a91dd87b053d01c0"
                              :date     "Thu Nov 26 09:06:49 AM PST 2020")

            ;; $ mkdir -p ./parseclj/
            ;; $ rm -rf ./parseclj/*
            ;; $ rm -rf ~/.emacs.d/site-lisp/parseclj
            ;; $ cp -rp ~/src/emacs-packages/parseclj/{*,.*~*.git} ./parseclj/
            ;; $ pushd ../../ ; rake install ; popd
            (zmd/package-info :name     "parseclj"
                              :ref      "master"
                              :upstream "https://github.com/clojure-emacs/parseclj.git"
                              :hashref  "eff941126859bc9e949eae5cd6c2592e731629f2"
                              :date     "Thu Nov 26 10:57:03 AM PST 2020")

            (zmd/package-info :name     "parseedn"
                              :ref      "master"
                              :upstream "https://github.com/clojure-emacs/parseedn.git"
                              :hashref  "90cfe3df51b96f85e346f336c0a0ee6bf7fee508"
                              :date     "")

            (zmd/package-info :name     "spinner"
                              :ref      "master"
                              :upstream "https://github.com/Malabarba/spinner.el.git"
                              :hashref  "d15e7a7b6395be69acda9d6464acc81d3e2ad07d"
                              :date     "")

            (zmd/package-info :name     "sesman"
                              :ref      "master"
                              :upstream "https://github.com/vspinu/sesman.git"
                              :hashref  "edee869c209c016e5f0c5cbb8abb9f3ccd2d1e05"
                              :date     "")

            (zmd/package-info :name     "transient"
                              :ref      "master"
                              :upstream "https://github.com/magit/transient.git"
                              :hashref  "8b22b52b838a26df915c0aedd5804ec9fc0fccff"
                              :date     "")

            (zmd/package-info :name     "with-editor"
                              :ref      "master"
                              :upstream "https://github.com/magit/with-editor.git"
                              :hashref  "6735180e73e787b79535c245b162249b70dbf841"
                              :date     "")

            (zmd/package-info :name     "projectile"
                              :ref      "v2.2.0"
                              :upstream "https://github.com/bbatsov/projectile.git"
                              :hashref  "dc0e7a5ba46f92bd224a5e89f0af2ace0ed05ade"
                              :date     "")

            (zmd/package-info :name     "magit"
                              :ref      "master"
                              :upstream "https://github.com/magit/magit.git"
                              :hashref  "6aa23bbce77f87265996eaa51dac4d71faae5ca5"
                              :date     "")

            (zmd/package-info :name     "cider"
                              :ref      "master"
                              :upstream "https://github.com/clojure-emacs/cider.git"
                              :hashref  "ef47c1de151c212b8d2ddeb9af6c8b0dfc0e300f"
                              :date     "")
            ))

(defun zmd/site-lisp-get (name)
  )

(zmd/site-lisp)
