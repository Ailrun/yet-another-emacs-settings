;;; yaes-dashboard --- startup screen of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package page-break-lines
  :diminish page-break-lines-mode)

(req-package all-the-icons
  :config
  (add-to-list 'all-the-icons-data/file-icon-alist '( "stylish-haskell" . "\xeb3d" ))
  (add-to-list 'all-the-icons-data/file-icon-alist '( "haskell-config" . "\xeb14" ))
  (add-to-list 'all-the-icons-icon-alist
               '("^\\.stylish-haskell\\.yaml$" all-the-icons-fileicon "stylish-haskell"  :face all-the-icons-lpurple))
  (add-to-list 'all-the-icons-icon-alist
               '("^stack.*\\.yaml$"            all-the-icons-fileicon "haskell-config"   :face all-the-icons-red))
  (add-to-list 'all-the-icons-icon-alist
               '("^stack.*\\.yaml\\.lock$"     all-the-icons-fileicon "haskell-config"   :face all-the-icons-red))
  (add-to-list 'all-the-icons-icon-alist
               '("\\.v$"                       all-the-icons-fileicon "coq"              :face all-the-icons-dmaroon))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(coq-mode all-the-icons-fileicon "coq" :face all-the-icons-dmaroon)))

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
