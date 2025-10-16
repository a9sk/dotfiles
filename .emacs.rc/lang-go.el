;; go language config

;; enable generic tools for go
;; golang setup
(add-hook 'go-mode-hook
          (lambda ()
            (lsp)
            (company-mode 1)
            (flycheck-mode 1)
            (yas-minor-mode 1)
            (add-hook 'before-save-hook 'gofmt-before-save nil t)))
