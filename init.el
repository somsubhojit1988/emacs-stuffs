;;;; starting this on 13 Jul 2018
;;; Subhojit Som susom@iu.edu

;;;; 1st thing => turn off startup message
(setq inhibit-startup-message t)

(require 'package)
;;;; setup melpa package manager
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa"."https://melpa.org/packages/"))
(package-initialize)


;;;; A package to help installing packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;;; A package that helps to try a package without actually installing it
(use-package try
  :ensure t)


;;;; Key binding helper package
(use-package which-key
  :ensure t
  :config (which-key-mode))


;;;; Org-mode stuffs
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook 'org-bullets-mode))
