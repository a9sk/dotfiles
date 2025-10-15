;; initialize package system
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; install use-package if missing
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)  ;; auto-install missing packages

;;; smex
;; smex is a smarter M-x with fuzz search, i find it helpful
(use-package smex
  :init (smex-initialize)
  :bind (("M-x" . smex)
         ("C-c C-c M-x" . execute-extended-command)))

;;; ido - interactive buffer/file selection
;; ido is an interactive buffer/file fuzz selector for C-x C-f
(use-package ido-completing-read+
  :init
  (ido-mode 1)
  (ido-everywhere 1)
  (ido-ubiquitous-mode 1))

;;; paredit
;; paredit is used for lisp structured config editing
(use-package paredit
  :hook ((emacs-lisp-mode
          clojure-mode
          lisp-mode
          common-lisp-mode
          scheme-mode
          racket-mode) . paredit-mode))

;;; yasnippet
;; just for snippets
(use-package yasnippet
  :init (yas-global-mode 1))

;;; magit
;; better git interface (used mainly for diff)
(use-package magit
  :bind (("C-c m s" . magit-status)
         ("C-c m l" . magit-log)))

;;; company
;; auto completion package
(use-package company
  :init (global-company-mode)
  :hook ((tuareg-mode . (lambda () (company-mode 0))))) ;; example disable in tuareg

;;; multiple-cursors
(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->"         . mc/mark-next-like-this)
         ("C-<"         . mc/mark-previous-like-this)
         ("C-c C-<"     . mc/mark-all-like-this)
         ("C-\""        . mc/skip-to-next-like-this)
         ("C-:"         . mc/skip-to-previous-like-this)))

;;; move-text
;; this i find quite helpful, it just moves the lines up or down with M-p and M-n keybindings
(use-package move-text
  :bind (("M-p" . move-text-up)
         ("M-n" . move-text-down)))
