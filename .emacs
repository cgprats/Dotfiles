;; Set Color Theme
(load-theme 'wombat)

;; Set Memory Constraints
(setq gc-cons-threshold 50000000)
(setq large-file-warning-threshold 100000000)

;; Use UTF-8 by Default
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Visual Options
(menu-bar-mode t)
(blink-cursor-mode t)
(global-hl-line-mode t)
(line-number-mode t)
(if (version<= "26.0.50" emacs-version)
    ;; On Newer emacs (>= 26.0.50), Use line-numbers-mode
    (global-display-line-numbers-mode 1)
  ;; Otherwise, Use linum-mode
  (global-linum-mode 1))
(column-number-mode t)
(size-indication-mode t)
(setq-default indicate-empty-lines t)

;; Enable XTerm mouse
(xterm-mouse-mode)

;; Use System Clipboard
(setq x-select-enable-clibpoard t)

;; Modify Temporary File Directory
(setq backup-directory-alist
        `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Accept y and n
(fset 'yes-or-no-p 'y-or-n-p)

;; Automatically reload files
(global-auto-revert-mode t)

;; Enable IDO Mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents t)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
