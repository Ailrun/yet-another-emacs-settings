;;; yaes-dashboard --- startup screen of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package page-break-lines
  :diminish page-break-lines-mode)

(req-package all-the-icons)

(req-package dashboard
  :require (page-break-lines all-the-icons)
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items
        '((projects . 5)
          (recents . 20)))
  (setq dashboard-center-content t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)
  (setq dashboard-page-separator "\n\f\f\n"))

(provide 'yaes-dashboard)
;;; yaes-dashboard.el ends here
