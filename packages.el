;; list the packages to install
(defconst install-package-list '(
			     ;;packages for package managing
			     package-utils
			     use-package
			     req-package
			     paradox
			     
			     ;;packages for C
			     c-eldoc

			     ;;packages for C++
			     demangle-mode
			     function-args

			     ;;pacakges for C/C++
			     cff
			     company-c-headers
			     dummy-h-mode
			     disaster
			     msvc
			     irony
			     irony-eldoc
			     company-irony
			     company-irony-c-headers

			     ;;packages for C#
			     csharp-mode
			     omnisharp

			     ;;packages for objective-C
			     objc-font-lock
			     ;;There is lack of packages (really?)

			     ;;packages for python
			     abl-mode
			     anaconda-mode
			     cinspect
			     company-jedi
			     elpy
			     ;;jedi
			     ;;jedi-direx
			     live-py-mode
			     ;;nose
			     pungi
			     ;;py-autopep8
			     py-gnitset
			     py-import-check
			     py-smart-operator
			     py-test
			     py-yapf
			     pydoc
			     pydoc-info
			     pyenv-mode
			     pyfmt
			     pyimpsort
			     pylint
			     pytest
			     python
			     python-docstring
			     python-environment
			     python-info
			     python-mode
			     python-x
			     python3-info
			     pythonic
			     pyvenv
			     sphinx-doc
			     sphinx-frontend
			     therapy
			     tox
			     virtualenv

			     ;;packages for java
			     autodisass-java-bytecode
			     ;;helm-jstack
			     java-imports
			     java-snippets
			     javadoc-lookup
			     ;;javaimp
			     jdee
			     ;;jtags
			     thread-dump
			     
			     ;;packages for jade
			     jade-mode

			     ;;packages for css
			     skewer-reload-stylesheets

			     ;;packages for less
			     less-css-mode
			     skewer-less

			     ;;packages for javascript
			     js2-highlight-vars angular-mode
			     ;;conkeror-minor-mode
			     import-js
			     ;;js-comint
			     js-doc
			     js2-closure
			     js2-refactor
			     ;;jscs
			     ;;jsfmt
			     jss
			     ;;kite
			     ;;kite-mini
			     ;;lived-mode
			     skewer-mode
			     
			     
			     ;;packages for typescript
			     typescript-mode
			     ;;packages for coffeescript
			     coffee-mode
			     ;;packages for json
			     json-mode
			     ;;packages for node
			     nodejs-repl
			     node-resolver
			     nvm

			     ;;pacakges for web dev
			     multi-web-mode
			     restclient
			     web-beautify
			     web-mode
			     company-web
			     ;;html-script-src
			     
			     ;;packages for mysql
			     emacsql-mysql

			     ;;package for haskell
			     haskell-mode
			     haskell-tab-indent
			     ghc
			     company-ghc
			     ghc-imported-from
			     ghci-completion
			     haskell-snippets
			     ;;hi2
			     ;;hyai
			     hindent
			     shm
			     ;;helm-ghc
			     ;;helm-hoogle

			     ;;packages for elisp
			     slime
			     haskell-emacs
			     haskell-emacs-base
			     haskell-emacs-text

			     ;;pacakges for markdown
			     markdown-mode+
			     markdown-preview-eww
			     markdown-preview-mode

			     ;;pacakges for git
			     ;;helm-git
			     ;;helm-git-files
			     ;;helm-git-grep
			     ;;helm-gitignore
			     ;;helm-ls-git
			     egg
			     gh
			     gitconfig
			     gitignore-mode
			     gitconfig-mode
			     gitattributes-mode
			     
			     ;;packages for project managing
			     gtags
			     ggtags
			     ;;helm-gtags
			     ;;helm-make
			     projectile
			     ;;helm-projectile
			     how-many-lines-in-project

			     ;;packages for aws
			     ;;helm-aws

			     ;;common packages
			     vlf
			     emr
			     aggressive-indent
			     async
			     guide-key
			     expand-region
			     undo-tree
			     vline
			     visible-color-code
			     highline
			     ;;helm
			     ;;helm-mode-manager
			     sr-speedbar
			     rainbow-delimiters
			     smartparens
			     ))

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
;;			 ("marmalade" . "https://marmalade.ferrier.me.uk/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "http://tromey.com/elpa/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("sunrise" . "http://joseito.republika.pl/sunrise-commander/")
			 ))
(eval-when-compile (package-initialize))

(defun install-package (package)
  "install package"
  (if (null (require package nil t))
      (progn (let* ((ARCHIVES (if (null package-archive-contents)
				  (progn (package-refresh-contents)
					 package-archive-contents)
				package-archive-contents))
		    (AVAIL (assoc package ARCHIVES)))
	       (if AVAIL
		   (package-install package)))
	     (require package))))

(install-package 'use-package)
(require 'use-package)
(use-package req-package
  :ensure t)
;;(install-package 'req-package)

;;(package-initialize)
;;(or (file-exists-p package-user-dir)
;;    (package-refresh-contents))

;;(dolist (package install-package-list)
;; (unless (package-installed-p package)
;;   (package-install package)))

(makunbound 'install-package-list)
