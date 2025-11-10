;; initialize package system
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; install use-package if missing
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)  ;; auto-install missing packages

;; exec path from shell as sometimes i will start emacs from dmenu (mosto of the time actually)
(rc/require 'exec-path-from-shell)  ;; ensure it is installed
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;;; smex
;; smex is a smarter M-x with fuzz search, i find it helpful
(use-package smex
  :init (smex-initialize)
  :bind (("M-x" . smex)
         ("C-c C-c M-x" . execute-extended-command)))

;;; ido
;; ido is an interactive buffer/file fuzz selector for C-x C-f
(use-package ido
  :init
  (ido-mode 1)
  (ido-everywhere 1)
  (setq ido-enable-flex-matching t ;; fuzzy matching
        ido-create-new-buffer 'always ;; always allow creating new files/buffers
        ido-auto-merge-work-directories-length -1 ;; stop jumping dirs
        ido-use-filename-at-point nil ;; don't guess filenames
        ido-use-url-at-point nil
        ido-confirm-unique-completion t))

;; marginalia
;; extra annotations (like file sizes, docstrings)
(use-package marginalia
  :init (marginalia-mode 1))

;; consult
;; better search tool
;; (rc/require 'consult)
;; (global-set-key (kbd "C-s") #'consult-line)
;; (global-set-key (kbd "C-c g") #'consult-ripgrep)

;; deadgrep
;; better looking vscode like find in files
(use-package deadgrep
  :bind (("C-c g" . deadgrep)))

;;; paredit
;; paredit is used for lisp structured config editing
(use-package paredit
  :hook ((emacs-lisp-mode
          clojure-mode
          lisp-mode
          common-lisp-mode
          scheme-mode
          racket-mode) . paredit-mode))

;;; yasnippet
;; just for snippets
(use-package yasnippet
  :init (yas-global-mode 1)
  (setq yas-snippet-dirs
        '("~/.emacs.snippets"
          "~/.emacs.d/snippets"
          ))
  :config
  (yas-global-mode 1))

;;; magit
;; better git interface (used mainly for diff)
(use-package magit
  :bind (("C-c m s" . magit-status)
         ("C-c m l" . magit-log)))

;;; company
;; auto completion package
(use-package company
  :init (global-company-mode)
  :hook ((tuareg-mode . (lambda () (company-mode 0))))) ;; example disable in tuareg
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-yasnippet))


;;; multiple-cursors
(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->"         . mc/mark-next-like-this)
         ("C-<"         . mc/mark-previous-like-this)
         ("C-c C-<"     . mc/mark-all-like-this)
         ("C-\""        . mc/skip-to-next-like-this)
         ("C-:"         . mc/skip-to-previous-like-this)))

;;; move-text
;; this i find quite helpful, it just moves the lines up or down with M-p and M-n keybindings
(use-package move-text
  :bind (("M-p" . move-text-up)
         ("M-n" . move-text-down)))


;; vterm
;; better terminal instead of the kitty one used in the rest of the system
(use-package vterm
  :ensure t
  :commands vterm
  :config
  (setq vterm-shell shell-file-name))


;; copilot
;; for inline ghost lines suggestions
(use-package copilot
  :vc (:url "https://github.com/copilot-emacs/copilot.el"
            :branch "main"
            :rev :newest)
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . copilot-accept-completion)
              ("TAB"   . copilot-accept-completion)
              ("C-<tab>" . copilot-accept-completion-by-word)
              ("C-S-<tab>" . copilot-next-completion))
  :config
  (setq copilot-idle-delay 0.1)
  (setq copilot-enable-predicates
        '(lambda () (not (company-tooltip-visible-p))))
  (setq copilot-indent-offset-warning-disable t))
