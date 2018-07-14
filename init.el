;;;; starting this on 13 Jul 2018
;;; Subhojit Som susom@iu.edu

;;;; Auto-generated code

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (counsel ace-window tabbar tab-bar which-key use-package try org-bullets))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))


;;; My stuffs

;;;; 1st thing => turn off startup message
(setq inhibit-startup-message t)
;;; acquire that little real-estate space
;;; from tool-bar
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

;;;; installing ace-window package, it helps
;;; switching between multiple (> 2) opened windows
;;; by assigning a number to each
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
    ))


;;;; swiper
;;; dependency => cunsel
(use-package counsel
  :ensure t
  )

(use-package swiper
  :ensure try
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    ))


;;;; Want bash completion on eshell
;;;  will be using this : emacs-bash-completion [https://github.com/szermatt/emacs-bash-completion]
;;;  adding the path to emacs-bash-completion to load path
(add-to-list 'load-path "/home/susom/.emacs.d/emacs-bash-completion/")
;;; as per the github page -
(autoload 'bash-completion-dynamic-complete 
  "bash-completion"
  "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
	  'bash-completion-dynamic-complete)


