;;; private/hlissner/init.el -*- lexical-binding: t; -*-

;; I've swapped these keys on my keyboard
(setq x-super-keysym 'meta
      x-alt-keysym   'alt

      user-mail-address "victor.franzi@gmail.com"
      user-full-name    "Victor Franzi")

;; An extra measure to prevent the flash of unstyled mode-line while Emacs is
;; booting up (when Doom is byte-compiled).
(setq-default mode-line-format nil)

;; host-specific settings
(pcase (system-name)
  ;; ("lili")
  ((or "lili" "fry")
   ;; smaller screen, smaller fonts
   (set! :font "Iosevka Term" :size 13)
   (set! :variable-font "Iosevka Term" :size 13)
   (set! :unicode-font "Iosevka Term" :size 13)
   (set-face-attribute 'default nil :height 100)
   (setq +doom-modeline-height 23))
  ;; ("fry")
  ;; ("isaac")
  ;; ("tati")
  )

;; openwith config
;;(require 'openwith)
;;(openwith-mode t)
;;(setq openwith-associations '(("\\.pdf\\'" "zathura" (file))))

;; CUA mode (C-c, C-v, C-x)
;; To use C-c, C-v, C-x for copy/paste/cut
(cua-mode t)

;; custom projects
;;(projectile-add-known-project “~/<path>”)
(projectile-add-known-project "~/.emacs.d/")
(projectile-add-known-project "~/bin/")

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; toggle window split with C-x |
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

;; prettier cursor
(setq-default cursor-type 'bar)

;; smooth scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time



;; autocomplete bitch
(require 'company)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)



;; shackle-rules
(setq shackle-rules
      '(("*OCaml*" :align right :size 0.5)
        ))



;; Setup compile command for C file
;; if no Makefile exists, it executes
;; gcc -o filename -g -std=c11 -Wall -Wextra -pedantic filename.c
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

;; Setup compile command for latex file
;; if no Makefile exists, it executes pdflatex filename.tex
(require 'compile)
(add-hook 'latex-mode-hook
          (lambda ()
            (unless (file-exists-p "Makefile")
              (set (make-local-variable 'compile-command)
                   (let ((file (file-name-nondirectory buffer-file-name)))
                     (format "%s %s"
                             ("pdflatex")
                             file))))))


;; F5: compile
(global-set-key (kbd "<f5>") 'compile)

;; shift-suppr delete while line
(global-set-key [S-delete] 'kill-whole-line)

;; move lines with ctrl + shift + arrow
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(control shift up)]  'move-line-up)
(global-set-key [(control shift down)]  'move-line-down)

;; use zathura for viewing latex' pdf
(setq TeX-view-program-list '(("Zathura" "zathura %o")))
(setq TeX-view-program-selection '((output-pdf "Zathura")))


;; use C-a to go on smart-home
(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.

Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive "^") ; Use (interactive) in Emacs 22 or older
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(global-set-key [(control a)] 'smart-beginning-of-line)
