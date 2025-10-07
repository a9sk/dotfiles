;; remove bloat (-1 removes menubar, toolbar and scrollbar)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; load paths from lisp/paths.el
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'paths)

;; set default starting directory for Emacs
(setq default-directory my-emacs-d)

;; initialize package system
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; install use-package if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; load personal modules
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'ui)
(require 'line-numbers)
(require 'shell-config)
(require 'eshell-config)

;; load custom variables
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)
