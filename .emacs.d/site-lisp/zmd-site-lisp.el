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
      (list
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

       ;; $ mkdir -p ./parseedn/
       ;; $ rm -rf ./parseedn/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/parseedn
       ;; $ cp -rp ~/src/emacs-packages/parseedn/{*,.*~*.git} ./parseedn/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "parseedn"
                         :ref      "master"
                         :upstream "https://github.com/clojure-emacs/parseedn.git"
                         :hashref  "90cfe3df51b96f85e346f336c0a0ee6bf7fee508"
                         :date     "Thu Nov 26 11:02:55 AM PST 2020")

       ;; $ mkdir -p ./spinner/
       ;; $ rm -rf ./spinner/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/spinner
       ;; $ cp -rp ~/src/emacs-packages/spinner/* ./spinner/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "spinner"
                         :ref      "master"
                         :upstream "https://github.com/Malabarba/spinner.el.git"
                         :hashref  "d15e7a7b6395be69acda9d6464acc81d3e2ad07d"
                         :date     "Thu Nov 26 11:11:51 AM PST 2020")

       ;; $ mkdir -p ./sesman/
       ;; $ rm -rf ./sesman/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/sesman
       ;; $ cp -rp ~/src/emacs-packages/sesman/{*,.*~*.git} ./sesman/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "sesman"
                         :ref      "master"
                         :upstream "https://github.com/vspinu/sesman.git"
                         :hashref  "edee869c209c016e5f0c5cbb8abb9f3ccd2d1e05"
                         :date     "Thu Nov 26 11:27:32 AM PST 2020")

       ;; $ mkdir -p ./macrostep/
       ;; $ rm -rf ./macrostep/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/macrostep
       ;; $ cp -rp ~/src/emacs-packages/macrostep/{*,.*~*.git} ./macrostep/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "macrostep"
                         :ref      "master"
                         :upstream "https://github.com/joddie/macrostep.git"
                         :hashref  "424e3734a1ee526a1bd7b5c3cd1d3ef19d184267"
                         :date     "Thu Nov 26 03:50:06 PM PST 2020")

       ;; $ mkdir -p ./memoize/
       ;; $ rm -rf ./memoize/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/memoize
       ;; $ cp -rp ~/src/emacs-packages/memoize/* ./memoize/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "memoize"
                         :ref      "master"
                         :upstream "https://github.com/skeeto/emacs-memoize.git"
                         :hashref  "51b075935ca7070f62fae1d69fe0ff7d8fa56fdd"
                         :date     "Thu Nov 26 03:56:59 PM PST 2020")

       ;; $ mkdir -p ./autothemer/
       ;; $ rm -rf ./autothemer/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/autothemer
       ;; $ cp -rp ~/src/emacs-packages/autothemer/* ./autothemer/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "autothemer"
                         :ref      "master"
                         :upstream "https://github.com/jasonm23/autothemer.git"
                         :hashref  "69488c71dfc182cf2e7be2d745037f230ade678e"
                         :date     "Fri Nov 27 11:18:58 AM PST 2020")

       ;; $ mkdir -p ./all-the-icons/
       ;; $ rm -rf ./all-the-icons/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/all-the-icons
       ;; $ cp -rp ~/src/emacs-packages/all-the-icons/{*,.*~*.git} ./all-the-icons/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "all-the-icons"
                         :ref      "4.0.1"
                         :upstream "https://github.com/domtronn/all-the-icons.el.git"
                         :hashref  "d363bb3e73909be013fcf35e1458bb654ec5bbaa"
                         :date     "Fri Nov 27 11:42:02 AM PST 2020")

       ;; $ mkdir -p ./projectile/
       ;; $ rm -rf ./projectile/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/projectile
       ;; $ cp -rp ~/src/emacs-packages/projectile/{*,.*~*.git} ./projectile/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "projectile"
                         :ref      "v2.2.0"
                         :upstream "https://github.com/bbatsov/projectile.git"
                         :hashref  "dc0e7a5ba46f92bd224a5e89f0af2ace0ed05ade"
                         :date     "Fri Nov 27 12:32:46 PM PST 2020")

       ;; $ mkdir -p ./web-mode/
       ;; $ rm -rf ./web-mode/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/web-mode
       ;; $ cp -rp ~/src/emacs-packages/web-mode/{*,.*~*.git} ./web-mode/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "web-mode"
                         :ref      "v17"
                         :upstream "https://github.com/fxbois/web-mode.git"
                         :hashref  "d115f8dc3052e5779938d782d9cdaa4533ef20ff"
                         :date     "Fri Nov 27 05:25:07 PM PST 2020")

       ;; $ mkdir -p ./coffee-mode/
       ;; $ rm -rf ./coffee-mode/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/coffee-mode
       ;; $ cp -rp ~/src/emacs-packages/coffee-mode/{*,.*~*.git} ./coffee-mode/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "coffee-mode"
                         :ref      "master"
                         :upstream "https://github.com/defunkt/coffee-mode.git"
                         :hashref  "35a41c7d8233eac0b267d9593e67fb8b6235e134"
                         :date     "Fri Nov 27 05:39:44 PM PST 2020")

       ;; $ mkdir -p ./yaml-mode/
       ;; $ rm -rf ./yaml-mode/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/yaml-mode
       ;; $ cp -rp ~/src/emacs-packages/yaml-mode/{*,.*~*.git} ./yaml-mode/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "yaml-mode"
                         :ref      "0.0.15"
                         :upstream "https://github.com/yoshiki/yaml-mode.git"
                         :hashref  "fc5e1c58f94472944c4aa838f00f6adcac6fa992"
                         :date     "Fri Nov 27 06:05:04 PM PST 2020")

       ;; $ mkdir -p ./markdown-mode/
       ;; $ rm -rf ./markdown-mode/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/markdown-mode
       ;; $ cp -rp ~/src/emacs-packages/markdown-mode/{*,.*~*.git} ./markdown-mode/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "markdown-mode"
                         :ref      "v2.4"
                         :upstream "https://github.com/jrblevin/markdown-mode.git"
                         :hashref  "7b854c8e70b6d6edee12aec4194f4eb239586804"
                         :date     "Fri Nov 27 07:01:33 PM PST 2020")

       ;; $ mkdir -p ./erlang/
       ;; $ rm -rf ./erlang/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/erlang
       ;; $ cp -p ~/src/emacs-packages/erlang/{LICENSE.txt,OTP_VERSION} ./erlang/
       ;; $ cp -rp ~/src/emacs-packages/erlang/lib/tools/emacs/* ./erlang/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "erlang"
                         :ref      "OTP-23.1.4"
                         :upstream "https://github.com/erlang/otp.git"
                         :hashref  "f48399440e07199f89e589ac91bc866651264298"
                         :date     "Sat Nov 28 01:36:59 PM PST 2020")

       ;; $ mkdir -p ./lfe-mode/
       ;; $ rm -rf ./lfe-mode/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/lfe-mode
       ;; $ cp -p ~/src/emacs-packages/lfe-mode/{LICENSE,VERSION} ./lfe-mode/
       ;; $ cp -rp ~/src/emacs-packages/lfe-mode/emacs/* ./lfe-mode/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "lfe-mode"
                         :ref      "develop"
                         :upstream "https://github.com/rvirding/lfe.git"
                         :hashref  "d8818317f5dad0eadb51160389591a5081fa062c"
                         :date     "Sat Nov 28 02:04:43 PM PST 2020")

       ;; $ mkdir -p ./elixir-mode/
       ;; $ rm -rf ./elixir-mode/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/elixir-mode
       ;; $ cp -rp ~/src/emacs-packages/elixir-mode/{*,.*~*.git} ./elixir-mode/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "elixir-mode"
                         :ref      "v2.3.2"
                         :upstream "https://github.com/elixir-editors/emacs-elixir.git"
                         :hashref  "c548a84e69787bcd04e0821351009c4448c96cac"
                         :date     "Sat Nov 28 02:22:24 PM PST 2020")

       ;; $ mkdir -p ./inf-elixir/
       ;; $ rm -rf ./inf-elixir/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/inf-elixir
       ;; $ cp -rp ~/src/emacs-packages/inf-elixir/* ./inf-elixir/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "inf-elixir"
                         :ref      "master"
                         :upstream "https://github.com/rolandtritsch/inf-elixir.git"
                         :hashref  "1d1a3fa374a53d0f6a2d67214d167aac6cb2bb5f"
                         :date     "Sat Nov 28 02:42:04 PM PST 2020")

       ;; $ mkdir -p ./inf-ruby/
       ;; $ rm -rf ./inf-ruby/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/inf-ruby
       ;; $ cp -rp ~/src/emacs-packages/inf-ruby/* ./inf-ruby/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "inf-ruby"
                         :ref      "master"
                         :upstream "https://github.com/nonsequitur/inf-ruby.git"
                         :hashref  "b0124578db09b64902c8ca981b02e74bec92ef36"
                         :date     "Sat Nov 28 02:52:56 PM PST 2020")

       ;; $ mkdir -p ./slime/
       ;; $ rm -rf ./slime/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/slime
       ;; $ cp -rp ~/src/emacs-packages/slime/{*,.*~*.git} ./slime/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "slime"
                         :ref      "v2.26"
                         :upstream "https://github.com/slime/slime.git"
                         :hashref  "v2.26"
                         :date     "Sun Nov 29 02:59:21 PM PST 2020")

       ;; $ mkdir -p ./clojure-mode/
       ;; $ rm -rf ./clojure-mode/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/clojure-mode
       ;; $ cp -rp ~/src/emacs-packages/clojure-mode/{*,.*~*.git} ./clojure-mode/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "clojure-mode"
                         :ref      "5.9.1"
                         :upstream "https://github.com/clojure-emacs/clojure-mode.git"
                         :hashref  "e8d6414043dc063d16598dc951c1ba8168738265"
                         :date     "Sun Nov 29 03:11:12 PM PST 2020")

       ;; $ mkdir -p ./inf-clojure/
       ;; $ rm -rf ./inf-clojure/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/inf-clojure
       ;; $ cp -rp ~/src/emacs-packages/inf-clojure/{*,.*~*.git} ./inf-clojure/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "inf-clojure"
                         :ref      "v3.0.0"
                         :upstream "https://github.com/clojure-emacs/inf-clojure.git"
                         :hashref  "2c8e46b584be71fe1a585c9072da86382710dc59"
                         :date     "Sun Nov 29 03:20:27 PM PST 2020")

       ;; $ mkdir -p ./cider/
       ;; $ rm -rf ./cider/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/cider
       ;; $ cp -rp ~/src/emacs-packages/cider/{*,.*~*.git} ./cider/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "cider"
                         :ref      "master"
                         :upstream "https://github.com/clojure-emacs/cider.git"
                         :hashref  "ef47c1de151c212b8d2ddeb9af6c8b0dfc0e300f"
                         :date     "Sun Nov 29 04:29:09 PM PST 2020")

       ;; $ mkdir -p ./doom-themes/
       ;; $ rm -rf ./doom-themes/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/doom-themes
       ;; $ cp -rp ~/src/emacs-packages/doom-themes/{*,.*~*.git} ./doom-themes/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "doom-themes"
                         :ref      "v2.1.6"
                         :upstream "https://github.com/hlissner/emacs-doom-themes.git"
                         :hashref  "39e6971e81181b86a57f65cd0ea31376203a9756"
                         :date     "Sun Nov 29 04:48:09 PM PST 2020")

       ;; $ mkdir -p ./kaolin-themes/
       ;; $ rm -rf ./kaolin-themes/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/kaolin-themes
       ;; $ cp -rp ~/src/emacs-packages/kaolin-themes/* ./kaolin-themes/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "kaolin-themes"
                         :ref      "v1.6.1"
                         :upstream "https://github.com/ogdenwebb/emacs-kaolin-themes.git"
                         :hashref  "1114a8d84b60eaf8cadb628a29e0eaf6b5906f69"
                         :date     "Sun Nov 29 05:06:29 PM PST 2020")

       ;; $ mkdir -p ./dracula-theme/
       ;; $ rm -rf ./dracula-theme/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/dracula-theme
       ;; $ cp -rp ~/src/emacs-packages/dracula-theme/{*,.*~*.git} ./dracula-theme/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "dracula-theme"
                         :ref      "v1.7.0"
                         :upstream "https://github.com/dracula/emacs.git"
                         :hashref  "7751d4d3115c5e873b73b670248c49ce8910997e"
                         :date     "Sun Nov 29 05:17:35 PM PST 2020")

       ;; $ mkdir -p ./gotham-theme/
       ;; $ rm -rf ./gotham-theme/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/gotham-theme
       ;; $ cp -rp ~/src/emacs-packages/gotham-theme/* ./gotham-theme/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "gotham-theme"
                         :ref      "master"
                         :upstream "https://depp.brause.cc/gotham-theme.git"
                         :hashref  "a549cd031859e24fd37a779323e1542aefe86d43"
                         :date     "Sun Nov 29 05:46:11 PM PST 2020")

       ;; $ mkdir -p ./darcula-theme/
       ;; $ rm -rf ./darcula-theme/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/darcula-theme
       ;; $ cp -rp ~/src/emacs-packages/darcula-theme/* ./darcula-theme/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "darcula-theme"
                         :ref      "master"
                         :upstream "https://gitlab.com/fommil/emacs-darcula-theme.git"
                         :hashref  "d9b82b58ded9014985be6658f4ab17e26ed9e93e"
                         :date     "Sun Nov 29 05:57:45 PM PST 2020")

       ;; $ mkdir -p ./gruber-darker-theme/
       ;; $ rm -rf ./gruber-darker-theme/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/gruber-darker-theme
       ;; $ cp -rp ~/src/emacs-packages/gruber-darker-theme/* ./gruber-darker-theme/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "gruber-darker-theme"
                         :ref      "master"
                         :upstream "https://github.com/rexim/gruber-darker-theme.git"
                         :hashref  "7f95ce96079eb22b9214435ed25c5af98f60b482"
                         :date     "Sun Nov 29 06:05:48 PM PST 2020")

       ;; $ mkdir -p ./monokai-theme/
       ;; $ rm -rf ./monokai-theme/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/monokai-theme
       ;; $ cp -rp ~/src/emacs-packages/monokai-theme/* ./monokai-theme/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "monokai-theme"
                         :ref      "master"
                         :upstream "https://github.com/oneKelvinSmith/monokai-emacs.git"
                         :hashref  "791baae69b02ee007cde779a80abc1a6b5962cf7"
                         :date     "Sun Nov 29 06:13:39 PM PST 2020")

       ;; $ mkdir -p ./nord-theme/
       ;; $ rm -rf ./nord-theme/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/nord-theme
       ;; $ cp -rp ~/src/emacs-packages/nord-theme/* ./nord-theme/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "nord-theme"
                         :ref      "v0.5.0"
                         :upstream "https://github.com/arcticicestudio/nord-emacs.git"
                         :hashref  "0f5295f99005a200191ce7b660e56cd0510cf710"
                         :date     "Sun Nov 29 06:18:01 PM PST 2020")

       ;; $ mkdir -p ./seti-theme/
       ;; $ rm -rf ./seti-theme/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/seti-theme
       ;; $ cp -rp ~/src/emacs-packages/seti-theme/* ./seti-theme/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "seti-theme"
                         :ref      "master"
                         :upstream "https://github.com/caisah/seti-theme.git"
                         :hashref  "9d76db0b91d4f574dd96ac80fad41da35bffa109"
                         :date     "Sun Nov 29 06:22:05 PM PST 2020")

       ;; $ mkdir -p ./solarized-theme/
       ;; $ rm -rf ./solarized-theme/*
       ;; $ rm -rf ~/.emacs.d/site-lisp/solarized-theme
       ;; $ cp -rp ~/src/emacs-packages/solarized-theme/{*,.*~*.git} ./solarized-theme/
       ;; $ pushd ../../ ; rake install ; popd
       (zmd/package-info :name     "solarized-theme"
                         :ref      "master"
                         :upstream "https://github.com/bbatsov/solarized-emacs.git"
                         :hashref  "92dcca5537fe8e3ce8a10885ef23ead4d151d9d7"
                         :date     "Sun Nov 29 06:31:43 PM PST 2020")

       (zmd/package-info :name     "spacemacs-theme"
                         :ref      "master"
                         :upstream "https://github.com/nashamri/spacemacs-theme.git"
                         :hashref  "1f5b03254de6bfa9645711f2b79781f5cca8d203"
                         :date     "")

       (zmd/package-info :name     "zenburn-theme"
                         :ref      "v2.7.0"
                         :upstream "https://github.com/bbatsov/zenburn-emacs.git"
                         :hashref  "3e00f0e2e6202dd61216e2cb967c1da6a62e9a8d"
                         :date     "")))
