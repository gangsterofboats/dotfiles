;;;; Packages

;;; Package manager settings
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t) ; MELPA
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)     ; Org Mode
(unless package--initialized (package-initialize t))

;;; Package archives order
(setq package-archive-priorities
      '(("melpa" . 20)
        ("org" . 20)
        ("gnu" . 10)))

;;; Enable Use-Package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;;; Packages
(use-package adoc-mode)
(use-package alchemist)
(use-package auth-source-pass
             :pin melpa)
(use-package cc-mode
             :config
             (setq c-default-style "bsd")
             (setq-default c-basic-offset 4))
(use-package cobol-mode
             :config
             (setq
              cobol-format-style 'lower-case
              cobol-source-format 'free))
(use-package crystal-mode)
(use-package csv-mode)
(use-package d-mode)
(use-package darkokai-theme)
(use-package deft)
(use-package emmet-mode
             :hook (sgml-mode css-mode))
(use-package ergoemacs-mode
             :defer nil
             :config
             (ergoemacs-mode t)
             (setq
              ergoemacs-theme nil
              ergoemacs-keyboard-layout "us"))
(use-package erlang)
(use-package ess)
(use-package expand-region
             :bind ("C-," . er/expand-region))
(use-package fountain-mode)
(use-package go-mode)
(use-package haskell-mode)
(use-package helm
             :defer nil
             :config (helm-mode t))
(use-package helm-swoop
             :bind ("C-f" . helm-swoop))
(use-package helpful
             :bind
             (("C-h f" . helpful-callable)
              ("C-h v" . helpful-variable)
              ("C-h k" . helpful-key)
              ("C-c C-d" . helpful-at-point)))
(use-package js2-mode
             :mode
             ("\\.js$" . js2-mode)
             ("\\.json$" . js2-jsx-mode)
             :config
             (setq
              js-indent-level 4
              js2-indent-level 4
              js2-basic-offset 4))
;; (use-package json-mode)
(use-package julia-mode)
(use-package lua-mode)
(use-package markdown-mode)
(use-package nim-mode)
(use-package noctilux-theme)
(use-package nov)
(use-package org
             :config (setq org-export-backends '(ascii groff html icalendar latex man md odt org texinfo))
             :ensure org-plus-contrib)
(use-package org-bullets
             :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode t))))
(use-package ox-asciidoc)
(use-package ox-rst)
(use-package paradox
             :config
             (setq 
              paradox-execute-asynchronously nil
              paradox-github-token t))
(use-package perl6-mode)
(use-package powershell)
(use-package racket-mode)
(use-package rainbow-mode)
(use-package rust-mode)
;; (use-package slime)
(use-package sly)
(use-package smart-mode-line
             :init (add-hook 'after-init-hook #'sml/setup)
             :config (setq sml/no-confirm-load-theme t))
(use-package smartparens
             :config (smartparens-global-mode t))
(use-package srcery-theme)
(use-package tide)
(use-package tuareg)
(use-package xah-elisp-mode)
(use-package yaml-mode)
(use-package yasnippet
             :bind ("C-^" . yas-global-mode))
(use-package yasnippet-snippets)
(use-package zerodark-theme)
(use-package zig-mode)

;;; Local packages
(use-package arc
             :load-path "lisp/")
(use-package smalltalk-mode
             :load-path "lisp/")

;;;; Settings

;;; Add directory to load path
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/"))

;;; Backup settings
(setq
 backup-by-copying t
 backup-directory-alist `(("." . ,(expand-file-name "~/.emacs.d/.backup.d/")))
 delete-old-versions t
 kept-new-versions 10
 kept-old-versions 5
 undo-tree-auto-save-history t
 undo-tree-history-directory-alist `(("." . ,(expand-file-name "~/.emacs.d/.undo.d/")))
 version-control t)

;;; Ensure UTF-8 usage
(prefer-coding-system 'utf-8-unix)
(set-charset-priority 'unicode)
;; (set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; (set-language-environment "UTF-8")
(set-selection-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq locale-coding-system 'utf-8)

;;; Garbage collection
(add-hook 'focus-out-hook #'garbage-collect)

;;; Hippie Expand
(global-set-key (kbd "C-;") #'hippie-expand)
(setq hippie-expand-try-functions-list
      '(
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        ))

;;; Line Numbers
(global-display-line-numbers-mode t)

;;; Set color theme
;; (load-theme 'darkokai t)
;; (load-theme 'noctilux t)
(load-theme 'srcery t)
;; (load-theme 'zerodark t)

;;; Set font
(set-face-font 'default "Consolas-12")

;;; View Mode
(require 'view)
(global-set-key (kbd "C-x C-q") #'view-mode)

;;; Some keybindings
(global-set-key (kbd "C-#") #'global-company-mode)
(global-set-key (kbd "C-'") #'comment-line)
(global-set-key (kbd "C-|") #'comment-box)
(global-set-key (kbd "M-!") #'shell-command)
(global-set-key (kbd "C-x C-d") #'dired) ; Switch these two.  Given buffer list keybindings, makes more sense
(global-set-key (kbd "C-x d") #'list-directory)

;;; Other settings
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(blink-cursor-mode t)
(column-number-mode t)
(defalias 'perl-mode 'cperl-mode) ; Use CPerl Mode for Perl 5
(display-time-mode t)
(global-subword-mode t)
(global-undo-tree-mode t)
(setq
 cperl-hairy t
 cperl-indent-level 4
 cursor-in-non-selected-windows nil
 custom-file (expand-file-name "~/.custom.el") ; (setq custom-file (make-temp-file ""))
 initial-frame-alist '((width . 125) (height . 30) (vertical-scroll-bars . nil))
 default-frame-alist '((width . 125) (height . 30) (vertical-scroll-bars . nil))
 frame-title-format '("" "%b - Emacs " emacs-version)
 gc-cons-threshold (* 100 1024 1024)
 history-length 1000 ; history-length t
 inhibit-startup-screen t
 load-prefer-newer t
 read-buffer-completion-ignore-case t
 require-final-newline t
 ring-bell-function #'ignore
 vc-follow-symlinks t)
(setq-default
 fill-column 80
 indent-tabs-mode nil
 tab-width 4)
(show-paren-mode t)

;;;; Functions

;;; Disable themes function
(defun disable-all-themes ()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes))

;;;; Final settings

;;; Load custom file
;; (load custom-file)

;;; Initial scratch mode
;; (setq-default initial-major-mode #'emacs-lisp-mode)
