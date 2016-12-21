;;; yaes-java --- Java related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(defconst yaes-jdee-server-dir "none")

(req-package jdee
  :if (and
       (version<= "24.3" emacs-version)
       (file-directory-p yaes-jdee-server-dir))
  :require (flycheck memoize dash)
  :commands (jdee-mode)
  :init (add-hook 'java-mode-hook #'jdee-mode))

(req-package mvn
  :if (executable-find "mvn")
  :commands (mvn mvn-compile mvn-clean mvn-test))

(provide 'yaes-java)
;;; yaes-java.el ends here
