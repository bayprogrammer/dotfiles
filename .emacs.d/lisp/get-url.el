;; handy function to print out contents from a url fetch
;;
;; source: KIM Taegyoon
;;         https://stackoverflow.com/questions/4448055/download-a-file-with-emacs-lisp/23251190#23251190
;;
;; usage: (print (get-url "http://www.gnu.org"))
;;
;; use get-url function to check if tls is set up correctly; should get warning
;; that certs are wrong:
;;
;;  (print (get-url "https://wrong.host.badssl.com/"))
;;  (print (get-url "https://self-signed.badssl.com/"))
;;
;; and also make sure valid certs work:
;;
;;  (print (get-url "https://duckduckgo.com/"))
;;
(defun get-url (url)
  (with-current-buffer (url-retrieve-synchronously url) (buffer-string)))
