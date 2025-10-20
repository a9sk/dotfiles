;; vlang language config

;; enable generic stuff for v
(add-hook 'v-mode-hook
	  (lambda ()
	    (lsp)
	    (company-mode 1)
	    (flycheck-mode 1)
	    (yas-minor-mode 1)))
