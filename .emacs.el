;;;; Packages

;;; Straight.el package manager settings
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;;; Packages
(use-package adoc-mode)
(use-package alchemist)
(use-package cobol-mode
             :config
             (setq
              cobol-format-style 'lower-case
              cobol-source-format 'free))
(use-package crystal-mode)
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
(use-package json-mode)
(use-package julia-mode)
(use-package lua-mode)
(use-package markdown-mode)
(use-package nim-mode)
(use-package noctilux-theme)
(use-package nov)
(use-package paradox)
(use-package perl6-mode)
(use-package powershell)
(use-package racket-mode)
(use-package rainbow-mode)
(use-package rust-mode)
(use-package smart-mode-line
             :init (add-hook 'after-init-hook #'sml/setup)
             :config
             (setq sml/no-confirm-load-theme t))
(use-package smartparens
             :config (smartparens-global-mode t))
(use-package srcery-theme)
(use-package tide)
(use-package tuareg)
(use-package xah-elisp-mode)
(use-package yaml-mode)
(use-package yascroll
             :init (scroll-bar-mode -1)
             :config
             (global-yascroll-bar-mode t)
             (setq yascroll:delay-to-hide nil))
(use-package yasnippet
             :bind ("C-^" . yas-global-mode))
(use-package yasnippet-snippets)
(use-package zerodark-theme)
(use-package zig-mode)

;;; Org Mode
(require 'subr-x)
(straight-use-package 'git)

(defun org-git-version ()
  "The Git version of org-mode.
Inserted by installing org-mode or when a release is made."
  (require 'git)
  (let ((git-repo (expand-file-name
                   "straight/repos/org/" user-emacs-directory)))
    (string-trim
     (git-run "describe"
              "--match=release\*"
              "--abbrev=6"
              "HEAD"))))

(defun org-release ()
  "The release version of org-mode.
Inserted by installing org-mode or when a release is made."
  (require 'git)
  (let ((git-repo (expand-file-name
                   "straight/repos/org/" user-emacs-directory)))
    (string-trim
     (string-remove-prefix
      "release_"
      (git-run "describe"
               "--match=release\*"
               "--abbrev=0"
               "HEAD")))))

(provide 'org-version)
(straight-use-package 'org)

;;; Conditional packages
;; (if (eq system-type 'gnu/linux)
    ;; (use-package slime))
(if (eq system-type 'gnu/linux)
    (use-package sly))
(if (eq system-type 'windows-nt)
    (use-package xah-find))

;;; Local packages
(use-package arc
  :load-path "lisp/"
  :straight nil)
(use-package smalltalk-mode
  :load-path "lisp/"
  :straight nil)

;;;; Settings

;;; Add directory to load path
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/"))

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
(global-set-key (kbd "C-'") #'comment-line)
(global-set-key (kbd "C-|") #'comment-box)
(global-set-key (kbd "M-!") #'shell-command)
(global-set-key (kbd "C-x C-d") #'dired) ; Switch these two.  Given buffer list keybindings, makes more sense
(global-set-key (kbd "C-x d") #'list-directory)

;;; Other settings
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(column-number-mode t)
(defalias 'perl-mode 'cperl-mode) ; Use CPerl Mode for Perl 5
(display-time-mode t)
(global-subword-mode t)
(global-undo-tree-mode t)
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8)
(set-language-environment "UTF-8")
(setq
 cperl-hairy t
 cperl-indent-level 4
 custom-file (expand-file-name "~/.custom.el") ; (setq custom-file (make-temp-file ""))
 initial-frame-alist '((width . 125) (height . 30) (vertical-scroll-bars . nil))
 default-frame-alist '((width . 125) (height . 30) (vertical-scroll-bars . nil))
 frame-title-format '("" "%b - Emacs " emacs-version)
 gc-cons-threshold (* 100 1024 1024)
 inhibit-startup-screen t
 load-prefer-newer t
 make-backup-files nil
 read-buffer-completion-ignore-case t
 ring-bell-function #'ignore
 vc-follow-symlinks t)
(setq-default
 c-basic-offset 4
 fill-column 80
 indent-tabs-mode nil
 tab-width 4)
(show-paren-mode t)
(tool-bar-mode -1)

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

;;; Set starting directory on Windows
(if (eq system-type 'windows-nt)
    (progn
      (cd (getenv "HOMEPATH"))
      (setq default-directory (expand-file-name "~/"))))
