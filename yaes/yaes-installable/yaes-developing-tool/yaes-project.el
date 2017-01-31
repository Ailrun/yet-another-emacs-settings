;;; yaes-project --- project management related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package projectile
  :config
  (setq projectile-indexing-method 'native)
  (setq projectile-mode-line '(:eval
                               (if (file-remote-p default-directory)
                                   " Prj"
                                 (format " [%s]"
                                         (projectile-project-name)))))
  (projectile-global-mode t))

(req-package perspective
  :require (cl cl-lib)
  :config
  (persp-mode t))

(req-package persp-projectile
  :require (perspective projectile cl-lib))

(provide 'yaes-project)
;;; yaes-project.el ends here
