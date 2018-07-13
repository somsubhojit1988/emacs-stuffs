;;;; starting this on 13 Jul 2018
;;; Subhojit Som susom@iu.edu

;;;; 1st thing => turn off startup message
(setq inhibit-startup-message t)
(tool-bar-mode -1)

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

;;;; Help with the list of buffers when trying to switch
;;; flexible matching is fancy it gives the options without
;;; actually typing the whole thing
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;;; Open up a different interface (in another window)
;;; to show the buffers we have opened - use ibuffer/
;;; ibuffer-other-window
(defalias 'list-buffers 'ibuffer)
;;; alternatively
;; (defalias 'list-buffers 'ibuffer-other-window)


;;;; tabbar: nice little package that opens tabs
;;; will be using it for a while now
(use-package tabbar
  :ensure t
  :config
  (tabbar-mode 1))






(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (tabbar tab-bar which-key use-package try org-bullets))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
