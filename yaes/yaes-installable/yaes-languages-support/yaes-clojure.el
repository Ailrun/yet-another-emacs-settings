;;; yaes-clojure --- Clojure related package setting of yaes -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(require 'use-package)

(use-package clojure-mode
  :if (version<= "24.4" emacs-version)
  :mode
  ("\\.clj\\'" . clojure-mode)
  ("\\.cljc\\'" . clojurec-mode)
  ("\\.cljx\\'" . clojurex-mode))

(use-package cider
  :if (version<= "24.4" emacs-version)
  :after (clojure-mode)
  :bind
  (:map clojure-mode-map
        ("C-c M-j" . cider-jack-in)))

(use-package flycheck-clojure
  :if (version<= "24" emacs-version)
  :after (flycheck clojure-mode)
  :hook
  (clojure-mode . flycheck-clojure-setup))

(provide 'yaes-clojure)
;;; yaes-clojure.el ends here
