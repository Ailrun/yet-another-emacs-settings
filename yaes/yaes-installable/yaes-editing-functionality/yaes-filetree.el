;;; yaes-filetree --- filetree related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(defun neotree-projectile-toggle ()
  "Toggle a neotree for projectile."
  (interactive)
  (save-selected-window
    (cond
     ((neo-global--window-exists-p)
      (neotree-hide))
     ((fboundp 'projectile-project-root)
      (let ((project-root (projectile-project-root))
            (file (buffer-file-name)))
        (neotree-dir project-root)
        (neotree-find file)))
     (t
      (error "Projectile is not available")))))

(use-package neotree
  :if (version<= "24.3" emacs-version)
  :commands (neotree-projectile-toggle neo-global--window-exists-p)
  :bind
  ("<f8>" . neotree-projectile-toggle))

(provide 'yaes-filetree)
;;; yaes-filetree.el ends here
