;; httprepl

(req-package httprepl
  :require (s dash)
  :commands (httprepl))


;; restclient

(req-package resclient
  :mode ("\\.rest\\'" . restclient-mode))

(req-package company-restclient
  :require (restclient company)
  :config ((add-to-list 'company-backends 'company-restclient)))


;; html


;; html template engine (jade)

(req-package jade-mode
  :mode ("\\.jade\\'" . jade-mode))


;; css

(req-package css-mode
  :mode ("\\.css\\'" . css-mode)
  :config ((setq css-indent-offset 2)))


;; less

(req-package less-css-mode
  :ensure t
  :mode ("\\.less\\'" . less-css-mode))


;; web aid

(req-package company-web
  :require (company dash web-completion-data)
  :config ((add-to-list 'company-backends 'company-web-html)
	   (add-to-list 'company-backends 'company-web-jade)
	   (add-to-list 'company-backends 'company-web-slim)))

(provide 'yaes-web)
