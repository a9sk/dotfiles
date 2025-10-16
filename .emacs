;; main entry, load helpers and modules
(setq custom-file "~/.emacs.custom.el")   ;; separate custom variables
(load custom-file t)

;; load helpers
(add-to-list 'load-path "~/.emacs.local/")
(load "~/.emacs.local/rc.el")  ;; defines rc helpers
(load "~/.emacs.local/my.el")  ;; defines my helper

;; load modules
(load "~/.emacs.rc/ui.el")
(load "~/.emacs.rc/packages.el")
(load "~/.emacs.rc/org-rc.el")
(load "~/.emacs.rc/misc-rc.el")
(load "~/.emacs.rc/lang-packages.el")
;; load go language config
(load "~/.emacs.rc/lang-go.el")

;; load custom-file if exists
(setq custom-file "~/.emacs.custom.el")
(load custom-file t)
