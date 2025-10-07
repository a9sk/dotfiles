;; contains line number config (to fix)

;; load paths from paths.el
(require 'paths)

;; show line numbers next to text
(global-display-line-numbers-mode t)

;; ABSOLUTE
(setq display-line-numbers-type 'absolute)  

;; RELATIVE (vim-like)
;; (setq display-line-numbers-type 'relative)

;; disable line numbers in terminals
(dolist (mode '(term-mode-hook vterm-mode-hook eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;;;;;;;;;;;;;
(provide 'line-numbers)
