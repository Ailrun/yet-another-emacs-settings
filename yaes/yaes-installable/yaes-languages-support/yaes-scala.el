;;; yaes-scala --- Scala related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package scala-mode
  :mode
  ("\\.scala\\'" . scala-mode))

(req-package lsp-metals
  :if (executable-find "metals-emacs")
  :config
  (add-hook 'scala-mode-hook #'lsp))

(req-package sbt-mode
  :if (and
       (version<= "24.4" emacs-version)
       (executable-find "sbt"))
  :config
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(provide 'yaes-scala)
;;; yaes-scala.el ends here
