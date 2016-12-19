;;; yaes-font --- font setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(defun yaes-font-setting (font face &optional attr)
  "If FONT is available, change FACE to use FONT with ATTR.
If FONT is not available, change FACE with ATTR."
  (let ((set-face-args `(,face nil)))
    (when (x-list-fonts font)
        (nconc set-face-args `(:font ,font)))
    (when attr
        (nconc set-face-args attr))
    (apply 'set-face-attribute set-face-args)))

;;;; Font settings
;;;;
(yaes-font-setting "Consolas" 'fixed-pitch)
(yaes-font-setting "Anonymous Pro" 'default '(:height 110))

(provide 'yaes-font)
;;; yaes-font.el ends here
