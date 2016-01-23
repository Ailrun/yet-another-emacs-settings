(req-package lisp-mode
  :require flycheck
  :commands lisp-mode
  :config (req-package-hooks-add-execute 'emacs-lisp-mode
	    (lambda () (add-to-list 'flycheck-disabled-checkers 'emacs-lisp-checkdoc))))

(req-package elisp-slime-nav
  :commands (elisp-slime-nav-mode)
  :init (progn (req-package-hooks-add-execute 'emacs-lisp-mode 'elisp-slime-nav-mode)
	       (req-package-hooks-add-execute 'lisp-interaction-mode 'elisp-slime-nav-mode)))

(req-package nameless
  :commands (nameless-mode-from-hook)
  :init (req-package-hooks-add-execute 'emacs-lisp-mode 'nameless-mode-from-hook))

(req-package ert-modeline
  :commands (ert-modeline-mode)
  :init (req-package-hooks-add-execute 'emacs-lisp-mode 'ert-modeline-mode))

(req-package overseer
  :require (dash pkg-info)
  :commands (overseer-mode)
  :init (progn (req-package-hooks-add-execute 'emacs-lisp-mode 'overseer-mode)))

(req-package ert-expectations)

(req-package undercover
  :require (dash shut-up))

(req-package el-mock)

(req-package emr
  :commands (emr-show-refactor-menu)
  :init (progn (define-key emacs-lisp-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
	       (define-key lisp-interaction-mode-map (kbd "M-RET") 'emr-show-refactor-menu))
  :config (emr-initialize))

(req-package litable
  :require (eldoc)
  :commands (litable-mode litable-accept-as-pure)
  :init (req-package-hooks-add-execute 'emacs-lisp-mode (lambda () (eldoc-mode 1))))

(req-package eldoc
  :commands (eldoc-mode)
  :init (progn (req-package-hooks-add-execute 'emacs-lisp-mode (lambda () (eldoc-mode 1)))
	       (req-package-hooks-add-execute 'lisp-interaction-mode (lambda () (eldoc-mode 1)))))
