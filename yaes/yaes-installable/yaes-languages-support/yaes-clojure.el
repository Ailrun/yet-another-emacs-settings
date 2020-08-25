;;; yaes-clojure --- Clojure related package setting of yaes

;;; Commentary:

;;; Code:

(require 'req-package)

(req-package clojure-mode
  :if (version<= "24.4" emacs-version)
  :mode
  ("\\.clj\\'" . clojure-mode)
  ("\\.cljc\\'" . clojurec-mode)
  ("\\.cljx\\'" . clojurex-mode))

(req-package cider
  :if (version<= "24.4" emacs-version)
  :require (clojure-mode)
  :commands (cider-jack-in)
  :bind
  (:map clojure-mode-map
        ("C-c M-j" . cider-jack-in)))

(req-package flycheck-clojure
  :if (version<= "24" emacs-version)
  :require (flycheck)
  :commands (flycheck-clojure-setup)
  :init
  (add-hook 'clojure-mode-hook #'flycheck-clojure-setup))

(provide 'yaes-clojure)
;;; yaes-clojure.el ends here
