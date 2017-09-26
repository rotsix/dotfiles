; package managers
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(load-theme 'brogrammer t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-24hr-format nil)
 '(display-time-day-and-date nil)
 '(package-selected-packages (quote (helm tuareg))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(term-color-black ((t (:foreground "#151515" :background "#1A1A1A"))))
 '(term-color-blue ((t (:foreground "#268bd2" :background "#1A1A1A"))))
 '(term-color-cyan ((t (:foreground "#2aa198" :background "#1A1A1A"))))
 '(term-color-green ((t (:foreground "#859900" :background "#1A1A1A"))))
 '(term-color-magenta ((t (:foreground "#d33682" :background "#1A1A1A"))))
 '(term-color-red ((t (:foreground "#cb2b16" :background "#1A1A1A"))))
 '(term-color-white ((t (:foreground "#a6a6a6" :background "#1A1A1A"))))
 '(term-color-yellow ((t (:foreground "#b58900" :background "#1A1A1A")))))
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x |") 'toggle-window-split)

;; lol, should I explain?
(set-language-environment "UTF-8")
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; no bars
;;(menu-bar-mode -1)
;;(tool-bar-mode -1)
;;(scroll-bar-mode -1)

;; CUA mode (C-c, C-v, C-x)
;; To use C-c, C-v, C-x for copy/paste/cut, just uncomment (remove ;) the following line
(cua-mode t)

;; Remove start screen
(setq inhibit-startup-screen t)

;; pretty cursor
(setq-default cursor-type 'hbar)

;; show matching parenthese
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Show line-number and column-number in the mode line
(global-linum-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Word wrap
(setq-default word-wrap t)

;; Dead circumflex
(load-library "iso-transl")

;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode nil)

;; add padding in number line
(setq linum-format "%4d ")


;; smooth scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time


;; Setup compile command for C file
;; if no Makefile exists, it executes
;; clang -o filename -O0 -g -std=c99 -Wall -Wextra filename.c
(require 'compile)
(add-hook 'c-mode-hook
          (lambda ()
            (unless (file-exists-p "Makefile")
              (set (make-local-variable 'compile-command)
                   (let ((file (file-name-nondirectory buffer-file-name)))
                     (format "%s -o %s %s %s"
                             (or (getenv "CC") "gcc")
                             (file-name-sans-extension file)
                             (or (getenv "CFLAGS") "-g -std=c11 -Wall -Wextra -pedantic")
                             file))))))



;; Setup compile command for python file
;; if no Makefile exists, it executes python filename.py
(require 'compile)
(add-hook 'python-mode-hook
          (lambda ()
            (unless (file-exists-p "Makefile")
              (set (make-local-variable 'compile-command)
                   (let ((file (file-name-nondirectory buffer-file-name)))
                     (format "%s %s %s"
                             (or (getenv "PYTHONP") "python")
                             (or (getenv "PYTHONFLAGS") "")
                             file))))))



;; Setup compile command for java file
;; if no Makefile exists, it executes javac filename.java
(require 'compile)
(add-hook 'java-mode-hook
          (lambda ()
            (unless (file-exists-p "Makefile")
              (set (make-local-variable 'compile-command)
                   (let ((file (file-name-nondirectory buffer-file-name)))
                     (format "%s %s %s"
                             (or (getenv "JAVAC") "javac")
                             (or (getenv "JAVAFLAGS") "")
                             file))))))


;; F5: compile
(global-set-key (kbd "<f5>") 'compile)

;; indentation
(setq tab-width 4)

;; default font
(add-to-list 'default-frame-alist '(font . "Iosevka Term"))
(set-face-attribute 'default t :font "Iosevka Term")
(set-frame-font "Iosevka Term" nil t)

;; remove all theses backup files
(setq backup-directory-alist '(("." . "~/.saves")))
(setq backup-by-copying-when-linked t
      version-control t
      kept-new-versions 2
      kept-old-versions 0
      delete-old-versions t)

;; don't highlight current line
(global-hl-line-mode -1)

;; auto-close parenthesis, braces, quotes...
(electric-pair-mode 1)

;; allow pasting selection outside of emacs
(setq x-select-enable-clipboard t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; case-insensitive C-x C-f
(setq read-file-name-completion-ignore-case t)

;; Save a list of recent files visited. (open recent file with C-x f)
(recentf-mode 1)
(setq recentf-max-saved-items 100) ;; just 20 is too recent

;; Save minibuffer history
(savehist-mode 1)
(setq history-length 1000)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Offer to create parent directories if they do not exist
;; http://iqbalansari.github.io/blog/2014/12/07/automatically-create-parent-directories-on-visiting-a-new-file-in-emacs/
(defun my-create-non-existent-directory ()
  (let ((parent-directory (file-name-directory buffer-file-name)))
    (when (and (not (file-exists-p parent-directory))
               (y-or-n-p (format "Directory `%s' does not exist! Create it?" parent-directory)))
      (make-directory parent-directory t))))

(add-to-list 'find-file-not-found-functions 'my-create-non-existent-directory)

;; open pdf with zathura
(require 'openwith)
(openwith-mode t)
(setq openwith-associations '(("\\.pdf\\'" "zathura" (file))))
