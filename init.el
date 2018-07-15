;;;; starting this on 13 Jul 2018
;;; Subhojit Som susom@iu.edu

;;;; Auto-generated code

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(line-number-mode nil)
 '(package-selected-packages
   (quote
    (mu4e-alert spacemacs-theme counsel ace-window tab-bar which-key use-package try org-bullets))))
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

;;;; Spacemacs theme download and load-theme
(use-package spacemacs-common
  :ensure spacemacs-theme
  :config (load-theme 'spacemacs-light t))

;;;; A package that helps to try a package without actually installing
;;;; it
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
;;; syntax higlighting in orgmode code blocks like their native mode
(setq org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-confirm-babel-evaluate nil
      org-edit-src-content-indentation 0)

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

;;;; REMOVING THIS
;;;; tabbar: nice little package that opens tabs
;;; will be using it for a while now
;; (use-package tabbar
;;   :ensure t
;;   :config
;;   (tabbar-mode 1))

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
;;;  will be using this : emacs-bash-completion
;;;  [https://github.com/szermatt/emacs-bash-completion] adding the
;;;  path to emacs-bash-completion to load path
(add-to-list 'load-path "/home/susom/.emacs.d/emacs-bash-completion/")
;;; as per the github page -
(autoload 'bash-completion-dynamic-complete 
  "bash-completion"
  "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
	  'bash-completion-dynamic-complete)

;;;; Auto fill comments only as suggested here -
;;;; https://www.emacswiki.org/emacs/FillingComments
(setq comment-auto-fill-only-comments t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EMAIL setup								  ;;
;; Trying to get to the point of reading emails on emacs.Following		  ;;
;; instructions of -							  ;;
;; http://cachestocaches.com/2017/3/complete-guide-email-emacs-using-mu-and-/ ;;
;; Have my and offlineimap setup						  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e/")
;;; straightly copying from:
;;; http://www.macs.hw.ac.uk/~rs46/posts/2014-01-13-mu4e-email-client.html
(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      mu4e-sent-messages-behavior 'sent
      mu4e-sent-folder "/Sent Items"
      mu4e-drafts-folder "/Drafts"
      user-mail-address "subhojit.som@pathpartnertech.com"
      user-full-name "Subhojit Som"
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-user "subhojit.som@pathpartnertech.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-stream-type 'starttls
      smtpmail-smtp-service 587)

(require 'mu4e)

(setq mu4e-maildir (expand-file-name "~/Email/mbsyncmail")
      mu4e-trash-folder "/Trash"
      mu4e-refile-folder "/Archive"
      message-signature-file (expand-file-name "~/.emacs.d/.signature")
      mu4e-view-show-images t
      mu4e-view-show-addresses t
      mu4e-attachment-dir "~/Downloads"
      mu4e-use-fancy-chars t
      )

; get mail
(setq mu4e-get-mail-command "mbsync -c ~/.emacs.d/.mbsyncrc gmail"
      mu4e-html2text-command "w3m -T text/html"
      mu4e-update-interval 120
      mu4e-headers-auto-update t
      mu4e-compose-signature-auto-include nil)

(setq mu4e-maildir-shortcuts
      '(
	("/PPINBOX"   . ?i)
	("/Sent Items". ?s)
	("/Trash"     . ?t)
	("/Drafts"    . ?d)
	))

;;; Bookmarks
(setq mu4e-bookmarks
      `(
	("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
	("flag:unread" "Unread messages" ?n)
        ("date:today..now" "Today's messages" ?t)
        ("date:7d..now" "Last 7 days" ?w)
        ("mime:image/*" "Messages with images" ?p)
        (,(mapconcat 'identity
                     (mapcar
                      (lambda (maildir)
                        (concat "maildir:" (car maildir)))
                      mu4e-maildir-shortcuts) " OR ")
         "All inboxes" ?i)))

;; show images
(setq mu4e-show-images t)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; general emacs mail settings; used when composing e-mail
;; the non-mu4e-* stuff is inherited from emacs/message-mode
(setq mu4e-reply-to-address "subhojit.som@pathpartnertech.com"
      user-mail-address "subhojit.som@pathpartnertech.com"
      user-full-name  "Subhojit Som")

;; don't save message to Sent Messages, IMAP takes care of this
; (setq mu4e-sent-messages-behavior 'delete)

;; Some org-mode in mail related stuffs
(require 'org-mu4e)
(setq org-mu4e-convert-to-html t)

(require 'org-mime)

;; The following key bindings are suggested, which bind the C-c M-o
;; key sequence to the appropriate org-mime function in both email and
;; Org-mode buffers, [https://github.com/org-mime/org-mime]
(add-hook 'message-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c M-o") 'org-mime-htmlize)))
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c M-o") 'org-mime-org-buffer-htmlize)))


;; the following can be used to nicely offset block quotes in email bodies
(add-hook 'org-mime-html-hook
          (lambda ()
            (org-mime-change-element-style
             "blockquote" "border-left: 2px solid gray; padding-left: 4px;")))

;; Render text between “@” in red color, you can use org-mime-html-hook:
(add-hook 'org-mime-html-hook
          (lambda ()
            (while (re-search-forward "@\\([^@]*\\)@" nil t)
              (replace-match "<span style=\"color:red\">\\1</span>"))))

;; spell check
(add-hook 'mu4e-compose-mode-hook
	  (defun my-do-compose-stuff ()
	    "My settings for message composition."
	    (set-fill-column 72)
	    (flyspell-mode)))

;;; Some stuffs taken from
;;; https://cestlaz.github.io/posts/using-emacs-39-mu4e/#.W0tYx3ZKhhF
;;; and his config:
;;; https://github.com/zamansky/using-emacs/blob/master/mu4econfig-sample.el
; this seems to fix the babel file saving thing
(defun org~mu4e-mime-replace-images (str current-file)
  "Replace images in html files with cid links."
  (let (html-images)
    (cons
     (replace-regexp-in-string ;; replace images in html
      "src=\"\\([^\"]+\\)\""
      (lambda (text)
        (format
         "src=\"./:%s\""
         (let* ((url (and (string-match "src=\"\\([^\"]+\\)\"" text)
                          (match-string 1 text)))
                (path (expand-file-name
                       url (file-name-directory current-file)))
                (ext (file-name-extension path))
                (id (replace-regexp-in-string "[\/\\\\]" "_" path)))
           (add-to-list 'html-images
                        (org~mu4e-mime-file
			 (concat "image/" ext) path id))
           id)))
      str)
     html-images)))

(add-to-list 'mu4e-view-actions
	     '("ViewInBrowser" . mu4e-action-view-in-browser) t)

(add-to-list 'mu4e-view-actions
	     '("ViewInBrowser" . mu4e-action-view-in-browser) t)


(use-package mu4e-alert
  :ensure t)

(mu4e-alert-set-default-style 'libnotify)
(add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
(add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)

;; use org structures and tables in message mode
(add-hook 'message-mode-hook 'turn-on-orgstruct)
(add-hook 'message-mode-hook 'turn-on-orgstruct++)
(add-hook 'message-mode-hook 'turn-on-orgtbl)
(require 'org-bullets)
(add-hook 'orgstruct-mode-hook (lambda() (org-bullets-mode 1)))
