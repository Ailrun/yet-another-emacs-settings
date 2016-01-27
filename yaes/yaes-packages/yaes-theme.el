(require 'req-package)

(req-package dracula-theme
  :require (smart-mode-line highlight-current-line))

(req-package boron-theme
  :require (smart-mode-line)
  :config
  (load-theme boron t))
