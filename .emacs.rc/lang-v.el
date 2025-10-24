;; vlang language config

;; enable generic stuff for v
(add-hook 'v-mode-hook
	  (lambda ()
	    (lsp)
	    (company-mode 1)
	    (flycheck-mode 1)
	    (yas-minor-mode 1))
      	    (add-hook 'before-save-hook
               (lambda ()
                 (when (eq major-mode 'v-mode)
                   (shell-command (format "v fmt -w %s" (shell-quote-argument buffer-file-name)))
                   (revert-buffer t t t)))
               nil t))
