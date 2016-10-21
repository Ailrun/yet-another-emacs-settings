;;; yaes-scala --- scala support of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; Major mode of scala
(req-package scala-mode
  ;; required emacs version : ???
  :mode ("\\.scala\\'" . scala-mode))

;; Major mode of sbt
(req-package sbt-mode
  ;; required emacs version : ???
  :pin melpa-stable
  :commands (sbt-start sbt-command)
  :config (substitute-key-definition
		   'minibuffer-complete-word
		   'self-insert-command
		   minibuffer-local-completion-map))
;; Does this needs hydra support?

;; Source code analyzer
(req-package ensime
  ;; required emacs version : ???
  :require (scala-mode sbt-mode yasnippet company dash s popup))

(provide 'yaes-scala)
;;; yaes-scala.el ends here
