;;; yaes-scala --- Scala related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package scala-mode
  :mode
  ("\\.scala\\'" . scala-mode))

(use-package lsp-metals
  :if (executable-find "metals-emacs")
  :after (scala-mode)
  :config
  (add-hook 'scala-mode-hook #'lsp))

(use-package sbt-mode
  :if (and
       (version<= "24.4" emacs-version)
       (executable-find "sbt"))
  :commands sbt-start sbt-command
  :config
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(provide 'yaes-scala)
;;; yaes-scala.el ends here
