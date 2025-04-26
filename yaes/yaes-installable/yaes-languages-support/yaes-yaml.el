;;; yaes-yaml --- YAML related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package yaml-mode
  :if (version<= "24.1" emacs-version)
  :mode
  ("\\.ya?ml\\'" . yaml-mode))

(provide 'yaes-yaml)
;;; yaes-yaml.el ends here
