;; main entry, load helpers and modules
(setq custom-file "~/.emacs.custom.el")   ;; separate custom variables
(load custom-file t)

;; move bloating backups to fixed place
;; put all backups (#file# and file~) in one place
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/auto-saves/" t)))

;; create those directories if they don't exist
(make-directory "~/.emacs.d/backups/" t)
(make-directory "~/.emacs.d/auto-saves/" t)

;; disable lockfiles (#file#)
(setq create-lockfiles nil)

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
;; load c language config
(load "~/.emacs.rc/lang-c.el")
;; load c++ language config
(load "~/.emacs.rc/lang-cpp.el")
;; load js language config
(load "~/.emacs.rc/lang-js.el")
;; load v language config
(load "~/.emacs.rc/lang-v.el")
