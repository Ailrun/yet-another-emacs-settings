;;; yaes-java --- Java related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package lsp-java
  :init
  (add-hook 'java-mode-hook #'lsp))

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
