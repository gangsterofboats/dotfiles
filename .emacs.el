;;; Requires

;; (require 'dired+)
;; (require 'ls-lisp+)

;; (require 'view)
;; (global-set-key (kbd "C-x C-q") #'view-mode)

;;; Packages

;; Package manager settings
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/")) ; MELPA
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")) ; Marmalade
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org Mode
(add-to-list 'package-archives '("SC" . "http://joseito.republika.pl/sunrise-commander/")) ; Sunrise Commander
(package-initialize)

;; Package archives order
(setq package-archive-priorities
      '(("melpa" . 30)
        ("org" . 30)
        ("SC" . 30)
        ("marmalade" . 20)
        ("melpa-stable" . 20)
        ("gnu" . 10)))

;; Use Package settings
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

(use-package alchemist)
;; (use-package amx
             ;; :defer nil
             ;; :config (amx-mode t)
             ;; :bind ("M-A" . amx-major-mode-commands))
(use-package crystal-mode)
(use-package d-mode)
(use-package emmet-mode
             :hook (sgml-mode css-mode))
(use-package ergoemacs-mode
             :defer nil
             :bind ("M-F" . zap-to-char)
             :init
             (setq
              ergoemacs-theme nil
              ergoemacs-keyboard-layout "us")
             :config (ergoemacs-mode t))
(use-package erlang)
(use-package ess)
(use-package fountain-mode)
(use-package go-mode)
(use-package haskell-mode)
(use-package helm
             :defer nil
             :bind
             (("M-a" . helm-M-x)
              ("C-o" . helm-find-files))
             :config (helm-mode t))
(use-package helm-swoop
             :bind ("C-f" . helm-swoop))
(use-package helpful
             :bind
             (("C-h f" . helpful-callable)
              ("C-h v" . helpful-variable)
              ("C-h k" . helpful-key)
              ("C-c C-d" . helpful-at-point)))
(use-package julia-mode)
(use-package lua-mode)
(use-package markdown-mode)
(use-package noctilux-theme)
(use-package nov)
(use-package org)
(use-package paradox)
(use-package perl6-mode)
(use-package powershell)
(use-package racket-mode)
(use-package rainbow-mode)
(use-package smart-mode-line
             :init
             (add-hook 'after-init-hook #'sml/setup))
(use-package smartparens
             :config (smartparens-global-mode t))
(use-package yascroll
             :init (scroll-bar-mode -1)
             :config
             (global-yascroll-bar-mode t)
             (setq yascroll:delay-to-hide nil))
(use-package yasnippet
             :bind ("C-^" . yas-global-mode))

;;; Settings

;; Add directory to load path
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/"))

;; Set color theme
(load-theme 'noctilux t)

;; Set font
(set-face-attribute 'default nil :font "Consolas-12")

;; Garbage collection
(add-hook 'focus-out-hook #'garbage-collect)

;; Hippie Expand
(global-set-key (kbd "C-;") #'hippie-expand)
(setq hippie-expand-try-functions-list
      '(
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        ; try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
        try-complete-file-name-partially
        try-complete-file-name
        ; try-expand-all-abbrevs
        ; try-expand-list
        ; try-expand-line
        ))

;; Line Numbers
(if (< emacs-major-version 26)
    (progn
      (global-linum-mode t)
      (set-face-attribute 'linum nil :box nil :slant 'normal)) ; prevent line numbers from inheriting line's italics
  (global-display-line-numbers-mode t))

;; Some keybindings
(global-set-key (kbd "C-'") #'comment-line)
(global-set-key (kbd "C-|") #'comment-box)
(global-set-key (kbd "M-!") #'shell-command)

;; (if (eq system-type 'windows-nt)
    ;; (progn
      ;; (setq w32-pass-lwindow-to-system nil)
      ;; (setq w32-lwindow-modifier 'super)
      ;; (setq w32-pass-rwindow-to-system nil)
      ;; (setq w32-rwindow-modifier 'super)))

;; Other settings
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(column-number-mode t)
(display-time-mode t)
(electric-pair-mode t)
(global-subword-mode t)
(global-undo-tree-mode t)
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8)
(set-language-environment "UTF-8")
(setq
 custom-file (expand-file-name "~/.custom.el")
 initial-frame-alist '((width . 125) (height . 30) (vertical-scroll-bars . nil))
 default-frame-alist '((width . 125) (height . 30) (vertical-scroll-bars . nil))
 frame-title-format '("" "%b - Emacs " emacs-version)
 diredp-hide-details-initially-flag nil
 gc-cons-threshold (* 100 1024 1024)
 inhibit-startup-screen t
 load-prefer-newer t
 make-backup-files nil
 read-buffer-completion-ignore-case t
 ring-bell-function #'ignore)
(setq-default
 c-basic-offset 4
 fill-column 80
 indent-tabs-mode nil
 tab-width 4)
(show-paren-mode t)

;;; Functions

;; Disable themes function
(defun disable-all-themes ()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes))

;;; Final settings

;; Load custom file
;; (setq custom-file (make-temp-file ""))
;; (load custom-file)

;; Initial scratch mode
;; (setq-default initial-major-mode #'emacs-lisp-mode)

;; Set starting directory on Windows
(if (eq system-type 'windows-nt)
    (progn
      (cd (getenv "HOMEPATH"))
      (setq default-directory (expand-file-name "~/"))))
