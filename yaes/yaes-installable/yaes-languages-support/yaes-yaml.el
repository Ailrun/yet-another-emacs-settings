;;; yaes-yaml --- yaml related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package yaml-mode
  :if (version<= "24.1" emacs-version)
  :mode
  ("\\.yml\\'" . yaml-mode))

(provide 'yaes-yaml)
;;; yaes-yaml.el ends here
