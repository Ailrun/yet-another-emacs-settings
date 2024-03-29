;;; yaes-mode-line --- mode line related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package diminish
  :force t)

(req-package rich-minority
  :require (cl-lib)
  :diminish rich-minority-mode
  :config
  (rich-minority-mode t))

(req-package smart-mode-line
  :if (version<= "24.3" emacs-version)
  :require (rich-minority)
  :custom
  (sml/line-number-format "%4l")
  (sml/position-percentage-format nil)
  (sml/shorten-directory t)
  (sml/name-width 20)
  (sml/theme 'respectful)
  :config
  (line-number-mode t)
  (column-number-mode t)
  (nconc
   sml/replacer-regexp-list
   '((".*/\\.emacs\\.d/" ":ED:")
     (":ED:elpa/" ":ELPA:")
     (":ED:yaes/" ":YAES:")
     (":YAES:yaes-installable" ":YAES-I:")
     (":YAES:yaes-developing" ":YAES-D:")
     (":YAES:yaes-external" ":YAES-E:")))
  (sml/setup))

(provide 'yaes-mode-line)
;;; yaes-mode-line.el ends here
