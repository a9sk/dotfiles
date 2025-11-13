;; go language config

;; enable generic tools for go
;; golang setup
(add-hook 'go-mode-hook
          (lambda ()
            (when (fboundp 'rc/prog-base-setup) (rc/prog-base-setup))
            (rc/add-before-save #'gofmt-before-save)))
