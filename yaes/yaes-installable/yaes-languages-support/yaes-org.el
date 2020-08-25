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
                                 (org . t))))

(req-package org-bullets
  :require (org)
  :functions (org-bullets-mode)
  :commands (org-bullets-mode)
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))

(req-package ox-ioslide
  :if (version<= "24.1" emacs-version)
  :require (org cl-lib f makey)
  :commands (org-ioslide-export-as-html
             org-ioslide-export-to-html))

(req-package ox-ioslide-helper
  :ensure ox-ioslide
  :require (ox-ioslide)
  :commands (ioslide:helper))

(req-package epresent
  :require (org)
  :commands (epresent-run)
  :bind
  (:map org-mode-map
        ("C-S-p" . epresent-run)))

(provide 'yaes-org)
;;; yaes-org.el ends here
