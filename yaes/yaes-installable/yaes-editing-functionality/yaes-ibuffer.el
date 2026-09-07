;;; yaes-ibuffer --- buffer listing related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package ibuffer
  :ensure nil
  :custom
  (ibuffer-use-other-window t)
  :bind
  ("C-x C-b" . ibuffer))

(use-package ibuffer-vc
  :after (ibuffer)
  :functions (ibuffer-do-sort-by-alphabetic)
  :commands (ibuffer-vc-set-filter-groups-by-vc-root)
  :hook
  (ibuffer . (lambda ()
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

(use-package ibuffer-tramp
  :after (ibuffer ibuffer-vc)
  :functions (ibuffer-update)
  :commands (ibuffer-tramp-generate-filter-groups-by-tramp-connection)
  :init
  (add-hook 'ibuffer-hook
            #'(lambda ()
                (setq ibuffer-filter-groups
                      (append
                       ibuffer-filter-groups
                       (ibuffer-tramp-generate-filter-groups-by-tramp-connection)))
                (ibuffer-update nil t))
            t))

(provide 'yaes-ibuffer)
;;; yaes-ibuffer.el ends here
