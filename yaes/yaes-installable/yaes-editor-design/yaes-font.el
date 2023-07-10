;;; yaes-font --- font setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(defun yaes-set-font (font face &optional attr)
  "If FONT is available, change FACE to use FONT with ATTR.
If FONT is not available, change FACE with ATTR."
  (let ((set-face-args `(,face nil)))
    (when (x-list-fonts font)
      (nconc set-face-args `(:family ,font)))
    (when attr
      (nconc set-face-args attr))
    (apply 'set-face-attribute set-face-args)))

;;;; Font settings
;;;;
(defun yaes-font-config ()
  ;; (yaes-set-font "Consolas" 'fixed-pitch)
  (yaes-set-font "JuliaMono" 'default '(:height 110))
  ;; (yaes-set-font "Mononoki" 'default '(:height 110))
  (set-fontset-font t 'hangul (font-spec :family "NanumGothicCoding")))

(defun yaes-font-hook ()
  (yaes-font-config)
  (remove-hook 'server-after-make-frame-hook #'yaes-font-hook))

(if (daemonp)
    (add-hook 'server-after-make-frame-hook #'yaes-font-hook)
  (yaes-font-config))

(provide 'yaes-font)
;;; yaes-font.el ends here
