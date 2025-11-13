;; c language config

;; enable generic stuff for c
;; c setup
(add-hook 'c-mode-hook
	  (lambda ()
	    (when (fboundp 'rc/prog-base-setup) (rc/prog-base-setup))
	    (rc/add-before-save #'clang-format-buffer)))
