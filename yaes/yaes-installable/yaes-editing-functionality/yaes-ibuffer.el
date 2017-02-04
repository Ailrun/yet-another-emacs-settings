;;; yaes-ibuffer --- buffer listing related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package ibuffer
  :config
  (setq ibuffer-use-other-window t)
  :bind
  (("C-x C-b" . ibuffer)))

(req-package ibuffer-vc
  :require (ibuffer cl-lib)
  :commands (ibuffer-vc-set-filter-groups-by-vc-root)
  :init
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-vc-set-filter-groups-by-vc-root)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic))))
  :config
  (add-to-list 'ibuffer-formats
               '(mark modified read-only vc-status-mini " "
                      (name 18 18 :left :elide)
                      " "
                      (size 9 -1 :right)
                      " "
                      (mode 16 16 :left :elide)
                      " "
                      (vc-status 8 8 :left)
                      " "
                      filename-and-process)))

(req-package ibuffer-tramp
  :require (ibuffer ibuffer-vc tramp)
  :init
  (add-hook 'ibuffer-hook
            (lambda ()
              (nconc
               ibuffer-filter-groups
               (ibuffer-tramp-generate-filter-groups-by-tramp-connection)))))

(provide 'yaes-ibuffer)
;;; yaes-ibuffer.el ends here
