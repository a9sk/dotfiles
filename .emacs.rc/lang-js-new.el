;; tree-sitter based JS/TS modes
(when (treesit-available-p)
  (add-to-list 'major-mode-remap-alist
               '(javascript-mode . js-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode)))

;; lsp-mode for JS/TS
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((js-ts-mode . lsp-deferred)
         (tsx-ts-mode . lsp-deferred))
  :custom
  (lsp-enable-snippet nil)
  (lsp-enable-symbol-highlighting t)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-completion-provider :none))

;; lsp-ui for better UI integrations
(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-hover nil))

;; company-mode and flycheck for completion and linting
(use-package company
  :hook (prog-mode . company-mode)
  :custom
  (company-idle-delay 0.2)
  (company-minimum-prefix-length 1))

(use-package flycheck
  :hook (prog-mode . flycheck-mode))

;; apheleia for code formatting
(use-package apheleia
  :hook ((js-ts-mode tsx-ts-mode) . apheleia-mode)
  :config
  (setf (alist-get 'prettier apheleia-formatters)
        '("prettier" "--stdin-filepath" filepath))
  (setf (alist-get 'js-ts-mode apheleia-mode-alist) 'prettier)
  (setf (alist-get 'tsx-ts-mode apheleia-mode-alist) 'prettier))


;; rainbow-delimiters for better bracket visibility
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(setq treesit-font-lock-level 4)

;; indentation settings
(setq-default tab-width 2)
(setq-default js-indent-level 2)
(setq-default typescript-indent-level 2)
(setq-default indent-tabs-mode nil)
