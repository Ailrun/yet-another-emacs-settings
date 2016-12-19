;;; yaes-scala --- scala related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package scala-mode
  :mode ("\\.scala\\'" . scala-mode))

(req-package sbt-mode
  :if (version<= "24.4" emacs-version)
  :config
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(req-package ensime
  :require (scala-mode sbt-mode yasnippet company dash s popup)
  :commands (ensime))

(provide 'yaes-scala)
;;; yaes-scala.el ends here
