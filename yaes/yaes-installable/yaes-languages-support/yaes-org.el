;;; yaes-org --- org mode related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package org
  :require (outline)
  :mode
  ("\\.org\\'" . org-mode)
  :init
  (setq org-replace-disputed-keys t)
  :config
  (add-hook 'org-mode-hook
            (lambda ()
              (add-hook 'completion-at-point-functions
                        #'pcomplete-completions-at-point nil t)))
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((coq . t)
                                 (emacs-lisp . t)
                                 (haskell . t)
                                 (makefile . t)
                                 (org . t)
                                 (scala . t))))

(req-package epresent
  :require (org)
  :commands (epresent-run)
  :bind
  (:map org-mode-map
        ("C-S-p" . epresent-run)))

(provide 'yaes-org)
;;; yaes-org.el ends here
