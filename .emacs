;;; .emacs  -*- lexical-binding: t -*-

(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(setq custom-file user-init-file)

;; ---------------------------------------------------------

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode t)

(setq ring-bell-function 'ignore)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-saves/" t)))
(make-directory "~/.emacs.d/backups/" t)
(make-directory "~/.emacs.d/auto-saves/" t)
(setq create-lockfiles nil)

;; Font
(set-face-attribute 'default nil :font "Monospace-20")

(use-package amaranth-dark-theme
  :config
  (load-theme 'amaranth-dark t))

;; ---------------------------------------------------------

(use-package smex
  :init (smex-initialize)
  :bind (("M-x" . smex)))

(use-package ido
  :ensure nil
  :init
  (ido-mode 1)
  (ido-everywhere 1)
  (setq ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-auto-merge-work-directories-length -1
        ido-use-filename-at-point nil
        ido-use-url-at-point nil
        ido-confirm-unique-completion t))

(use-package marginalia
  :init (marginalia-mode 1))

(use-package deadgrep
  :bind (("C-c g" . deadgrep)))

;; ---------------------------------------------------------

(delete-selection-mode 1)
(setq select-enable-clipboard t)
(setq select-enable-primary t)

(use-package yasnippet
  :init
  (setq yas-snippet-dirs '("~/.emacs.snippets"))
  :config
  (yas-global-mode 1))

;; ---------------------------------------------------------

(global-set-key (kbd "C-c C-c") #'comment-line)
(global-set-key (kbd "C-c '") (lambda () (interactive) (insert "`")))
(global-set-key (kbd "<backtab>")
                (lambda () (interactive)
                  (if (use-region-p)
                      (indent-rigidly (region-beginning) (region-end) -4)
                    (indent-for-tab-command))))
(global-set-key (kbd "<f5>") #'compile)

(fset 'yes-or-no-p 'y-or-n-p)

;; ---------------------------------------------------------

(use-package htmlize
  :ensure t)

;; ---------------------------------------------------------

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :custom
  (lsp-enable-indentation nil)
  (lsp-enable-on-type-formatting nil)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-completion-provider :none))

(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-doc-show-with-mouse t)
  (lsp-ui-doc-delay 0.5)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-sideline-enable nil)
  (lsp-ui-sideline-show-hover nil)
  :bind
  (:map lsp-mode-map
        ("C-c d" . lsp-ui-doc-glance)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package clang-format)

;; ---------------------------------------------------------

;; go
(use-package go-mode)
(use-package go-eldoc)

(defun my/go-module-root ()
  "Return nearest Go workspace root (go.work/go.mod), or nil."
  (or (locate-dominating-file default-directory "go.work")
      (locate-dominating-file default-directory "go.mod")))

(add-hook 'go-mode-hook
          (lambda ()
            (let ((root (my/go-module-root)))
              (when root
                (setq-local default-directory root)
                (lsp-deferred))
              (add-hook 'before-save-hook #'gofmt-before-save nil t))))

;; c and c++
(use-package cc-mode
  :ensure nil)

(add-hook 'c-mode-hook
          (lambda ()
            (lsp-deferred)
            (yas-minor-mode 1)
            (add-hook 'before-save-hook #'clang-format-buffer nil t)))

(add-hook 'c++-mode-hook
          (lambda ()
            (lsp-deferred)
            (yas-minor-mode 1)
            (add-hook 'before-save-hook #'clang-format-buffer nil t)))

;; js :/
(when (treesit-available-p)
  (add-to-list 'major-mode-remap-alist '(javascript-mode . js-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode)))

(setq treesit-font-lock-level 4)
(setq-default tab-width 4)
(setq-default js-indent-level 4)
(setq-default typescript-indent-level 4)

(defun my/lsp-format-before-save ()
  "Format buffer with LSP before saving."
  (add-hook 'before-save-hook #'lsp-format-buffer nil t))

(add-hook 'js-ts-mode-hook #'my/lsp-format-before-save)
(add-hook 'tsx-ts-mode-hook #'my/lsp-format-before-save)

;; other
(use-package dockerfile-mode
  :mode ("Dockerfile\\'" . dockerfile-mode))

(use-package toml-mode)

(use-package json-mode)

;; ---------------------------------------------------------

(custom-set-variables)
(custom-set-faces)
