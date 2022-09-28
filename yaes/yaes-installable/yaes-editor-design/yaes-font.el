;;; yaes-font --- font setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(defun yaes-font-setting (font face &optional attr)
  "If FONT is available, change FACE to use FONT with ATTR.
If FONT is not available, change FACE with ATTR."
  (if window-system
      (let ((set-face-args `(,face nil)))
        (when (x-list-fonts font)
          (nconc set-face-args `(:family ,font)))
        (when attr
          (nconc set-face-args attr))
        (apply 'set-face-attribute set-face-args))))

;;;; Font settings
;;;;
(yaes-font-setting "Mononoki" 'fixed-pitch)
(yaes-font-setting "Mononoki" 'default '(:height 110))
(set-fontset-font t 'hangul (font-spec :family "NanumGothicCoding"))

(provide 'yaes-font)
;;; yaes-font.el ends here
