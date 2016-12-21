;;; yaes-elisp --- Elisp related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package elisp-refs
  :require (dash f list-utils loop s)
  :commands (elisp-refs-function
             elisp-refs-macro
             elisp-refs-variable
             elisp-refs-special
             elisp-refs-symbol))

(provide 'yaes-elisp)
;;; yaes-elisp.el ends here
