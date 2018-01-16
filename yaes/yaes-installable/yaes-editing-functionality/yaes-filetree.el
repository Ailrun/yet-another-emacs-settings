;;; yaes-filetree --- filetree related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(defun neotree-projectile-toggle ()
  (interactive)
  (save-selected-window
    (cond
     ((fboundp 'projectile-project-root)
      (let ((project-root (projectile-project-root))
            (file (buffer-file-name)))
        (neotree-dir project-root)
        (neotree-find file)))
     (t
      (error "Projectile is not available")))))

(req-package neotree
  :if (version<= "24.3" emacs-version)
  :demand t
  :bind
  (("<f8>" . neotree-projectile-toggle)))

(provide 'yaes-filetree)
;;; yaes-filetree.el ends here
