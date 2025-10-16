;; c++ language config

;; enable generic stuff for c++
;; c++ setup
(add-hook 'c++-mode-hook
	  (lambda ()
	    (lsp)
	    (company-mode 1)
	    (flycheck-mode 1)
	    (yas-minor-mode 1)
	    (add-hook 'before-save-hook #'clang-format-buffer nil t)))
