;;; yaes-java --- Java related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package lsp-java
  :after (java-mode)
  :hook
  (java-mode . lsp))

;; Todo:
;; Let's try Meghanada
;; (setq-default jdee-server-dir yaes-jdee-server-dir)

;; (req-package jdee
;;   :if (and
;;        (version<= "24.3" emacs-version)
;;        (file-directory-p yaes-jdee-server-dir))
;;   :require (flycheck memoize dash)
;;   :commands (jdee-mode))

;; (req-package mvn
;;   :if (executable-find "mvn")
;;   :commands (mvn mvn-compile mvn-clean mvn-test))

;; (req-package java-snippets
;;   :require (yasnippet))

(provide 'yaes-java)
;;; yaes-java.el ends here
