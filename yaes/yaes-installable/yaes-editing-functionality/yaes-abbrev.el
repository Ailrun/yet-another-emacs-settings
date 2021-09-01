;;; yaes-abbrev --- abbrev related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package abbrev
  :ensure nil
  :demand t
  :diminish abbrev-mode)

(provide 'yaes-abbrev)
;;; yaes-abbrev.el ends here
