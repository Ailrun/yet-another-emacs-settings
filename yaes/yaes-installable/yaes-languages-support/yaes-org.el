;;; yaes-org --- org mode related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package org
  :functions pcomplete-completions-at-point
  :mode
  ("\\.org\\'" . org-mode)
  :custom
  (org-replace-disputed-keys t)
  :hook
  (org-mode . (lambda ()
                (add-hook 'completion-at-point-functions
                          #'pcomplete-completions-at-point nil t)))
  :config
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((coq . t)
                                 (emacs-lisp . t)
                                 (haskell . t)
                                 (makefile . t)
                                 (org . t))))

(use-package org-bullets
  :after (org)
  :functions (org-bullets-mode)
  :commands (org-bullets-mode)
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))

(use-package ox-ioslide
  :if (version<= "24.1" emacs-version)
  :after (org)
  :commands (org-ioslide-export-as-html
             org-ioslide-export-to-html))

(use-package ox-ioslide-helper
  :ensure nil
  :after (ox-ioslide)
  :commands (ioslide:helper))

(use-package epresent
  :after (org)
  :bind
  (:map org-mode-map
        ("C-S-p" . epresent-run)))

(provide 'yaes-org)
;;; yaes-org.el ends here
