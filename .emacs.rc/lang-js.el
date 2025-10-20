;; javascript language config

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

;; enable generic stuff for javascript
(add-hook 'js2-mode-hook
          (lambda ()
	    (lsp-deferred)
            (company-mode 1)
            (flycheck-mode 1)
            (prettier-js-mode 1)
            (tide-setup)
            (tide-hl-identifier-mode 1)))

(add-hook 'rjsx-mode-hook
          (lambda ()
            (company-mode 1)
            (flycheck-mode 1)
            (prettier-js-mode 1)
            (tide-setup)
            (tide-hl-identifier-mode 1)))

(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (tide-setup)
              (tide-hl-identifier-mode 1))
	    (company-mode 1)
            (flycheck-mode 1)
            (prettier-js-mode 1)))

