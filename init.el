;;;; starting this on 13 Jul 2018
;;;  Subhojit Som susom@iu.edu

;;; My stuffs
(require 'package)
;;;; setup melpa package manager
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa"."https://melpa.org/packages/"))
(package-initialize)

;;; boot strap use-package
;;;; A package to help installing packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
;;; Leaving this monstrosity for now
;;(org-babel-load-file (expand-file-name "~/.emacs.d/email-setup.org"))

;;;; REMOVING THIS
;;;; tabbar: nice little package that opens tabs
;;; will be using it for a while now
;; (use-package tabbar
;;   :ensure t
;;   :config
;;   (tabbar-mode 1))

;;; color theme
;; (use-package color-theme
;;   :ensure t)

;; ;;(load-theme 'leuven t)
;; (use-package zenburn-theme
;;   :ensure t
;;   :config (load-theme 'zenburn t))
