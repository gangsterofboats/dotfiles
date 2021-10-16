;;;; -*- lexical-binding: t -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs configuration -- init.el file                                      ;;
;; Copyright (C) 2021 Michael Wiseman                                       ;;
;;                                                                          ;;
;; This program is free software: you can redistribute it and/or modify it  ;;
;; under the terms of the GNU Affero General Public License as published by ;;
;; the Free Software Foundation, either version 3 of the License, or (at    ;;
;; your option) any later version.                                          ;;
;;                                                                          ;;
;; This program is distributed in the hope that it will be useful, but      ;;
;; WITHOUT ANY WARRANTY; without even the implied warranty of               ;;
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero ;;
;; General Public License for more details.                                 ;;
;;                                                                          ;;
;; You should have received a copy of the GNU Affero General Public License ;;
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; Packages

;;; Enable Use Package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;;; Color theme packages
(use-package modus-themes)
(use-package srcery-theme)

;;; Languae packages

;; Multiple languages
(use-package yasnippet
  :bind ("C-^" . yas-global-mode))
(use-package yasnippet-snippets)

;; COBOL
(use-package cobol-mode
  :config
  (setq
   cobol-format-style 'lower-case
   cobol-source-format 'free))

;; Coffeescript
(use-package coffee-mode
  :config (setq coffee-tab-width 4))

;; Common Lisp
(use-package sly)

;; Crystal
(use-package crystal-mode)

;; D
(use-package d-mode)

;; Elixir
(use-package alchemist)
(use-package elixir-mode)

;; Emacs Lisp
(use-package xah-elisp-mode)

;; Erlang
(use-package erlang)

;; Go
(use-package go-mode)

;; Haskell
(use-package haskell-mode)

;; HTML
(use-package emmet-mode
  :hook (sgml-mode css-mode))
(use-package web-mode)
(use-package xah-css-mode
  :after (xah-replace-pairs))

;; Javascript
(use-package js2-mode
  :mode ("\\.js$" . js2-mode)
  :config
  (setq
   js-indent-level 4
   js2-indent-level 4
   js2-basic-offset 4))
(use-package json-mode)

;; Julia
(use-package julia-mode)

;; Lua
(use-package lua-mode)

;; Nim
(use-package nim-mode)

;; OCaml
(use-package tuareg)

;; Perl6
(use-package raku-mode)

;; Powershell
(use-package powershell)

;; Python
(use-package elpy)

;; R
(use-package ess)

;; Racket
(use-package racket-mode)

;; Ruby
(use-package enh-ruby-mode
  :mode ("\\.rb\\'" . ruby-mode))

;; Rust
(use-package rust-mode)

;; Smalltalk
(use-package smalltalk-mode)

;; SQL
(use-package sql-indent)

;; TeX/LaTeX
(use-package tex
  :ensure auctex)

;; Typescript
(use-package tide)

;; VimL/Vimscript
(use-package vimrc-mode)

;; Zig
(use-package zig-mode)

;;; Other packages
(use-package adoc-mode)
(use-package crossword)
(use-package csv-mode)
(use-package doom-modeline
  :init (doom-modeline-mode t)
  :config
  (setq
   doom-modeline-bar-width 3
   doom-modeline-gnus t
   doom-modeline-icon (display-graphic-p)
   doom-modeline-unicode-fallback t))
(use-package eglot)
(use-package ergoemacs-mode
  :demand t
  :config
  (ergoemacs-mode t)
  (setq
   ergoemacs-theme nil
   ergoemacs-keyboard-layout "us"))
(use-package expand-region
  :bind ("C-," . er/expand-region))
(use-package fountain-mode)
(use-package fzf)
(use-package gnu-elpa-keyring-update)
(use-package helm
  :demand t
  :bind
  (([remap execute-extended-command] . helm-M-x)
   ([remap find-file] . helm-find-files)
   ([remap list-buffers] . ibuffer)
   ([remap switch-to-buffer] . helm-mini)
   ([remap isearch-forward] . helm-swoop))
  :config (helm-mode t))
(use-package helm-swoop
  :bind ("C-f" . helm-swoop))
(use-package helpful
  :bind
  (("C-h f" . helpful-callable)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)
   ("C-c C-d" . helpful-at-point)))
(use-package markdown-mode)
(use-package nov)
(use-package org
  :init (setq org-export-backends '(ascii groff html icalendar latex man md odt org texinfo)))
(use-package org-contrib)
(use-package ox-asciidoc)
(use-package ox-rst)
(use-package paradox
  :config
  (setq
   paradox-execute-asynchronously nil
   paradox-github-token t))
(use-package rainbow-mode)
(use-package smartparens
  :config (smartparens-global-mode t))
(use-package speed-type)
(use-package undo-fu)
(use-package undo-tree
  :config (global-undo-tree-mode t))
(use-package vdiff)
(use-package which-key
  :config (which-key-mode))
(use-package xah-replace-pairs)
(use-package yaml-mode)

;;; Local packages
(use-package arc
  :load-path "lisp/"
  :mode ("\\.arc$" . arc-mode))

(use-package helm-fzf
  :load-path "lisp/")

;;;; Settings

;;; Add directory to load path
(add-to-list 'load-path (expand-file-name "~/.local/share/emacs/lisp/"))

;;; Backup settings
(setq
 auto-save-file-name-transforms `((".*" ,(expand-file-name "~/.local/share/emacs/save/") t))
 backup-by-copying t
 backup-directory-alist `(("." . ,(expand-file-name "~/.local/share/emacs/backup/")))
 delete-old-versions t
 kept-new-versions 10
 kept-old-versions 5
 undo-tree-auto-save-history t
 undo-tree-history-directory-alist `(("." . ,(expand-file-name "~/.local/share/emacs/undo/")))
 version-control t)

;;; C/C++/CC-Mode Settings
(setq
 c-basic-offset 4
 c-default-style "bsd")

;;; CPerl settings (for Perl5/7)
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))
(setq
  ; Style settings
  ; Basically the PBP setting of cperl-set-style
 cperl-brace-offset 0
 cperl-continued-brace-offset 0
 cperl-continued-statement-offset 4
 cperl-extra-newline-before-brace nil
 cperl-extra-newline-before-brace-multiline nil
 cperl-indent-level 4
 cperl-indent-parens-as-block t
 cperl-label-offset -2
 cperl-merge-trailing-else nil
 cperl-tab-always-indent t
  ; Other settings
 cperl-hairy t
 cperl-highlight-variables-indiscriminately t
 cperl-indent-wrt-brace nil)

;;; Ensure UTF-8 usage
(prefer-coding-system 'utf-8-unix)
(set-charset-priority 'unicode)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq locale-coding-system 'utf-8)

;;; Garbage collection
(add-function :after after-focus-change-function
              (lambda ()
                (unless (frame-focus-state)
                  (garbage-collect))))

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
(load-theme 'srcery t)

;;; Set font
(set-face-font 'default "Fira Code-16")

;;; View Mode
(require 'view)
(global-set-key (kbd "C-x C-q") #'view-mode)

;;; Some keybindings
(global-set-key (kbd "C-#") #'global-company-mode)
(global-set-key (kbd "C-'") #'comment-line)
(global-set-key (kbd "C-\"") #'comment-dwim)
(global-set-key (kbd "C-|") #'comment-box)
(global-set-key (kbd "M-!") #'shell-command)
(global-set-key (kbd "M-A") #'eval-expression)
(global-set-key (kbd "C-x C-d") #'dired) ; Switch these two.  Given buffer list keybindings, makes more sense
(global-set-key (kbd "C-x d") #'list-directory)

;;; Other settings
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(blink-cursor-mode t)
(column-number-mode t)
(display-time-mode t)
(global-auto-revert-mode t)
(global-subword-mode t)
(setq
 confirm-kill-emacs 'y-or-n-p
 cursor-in-non-selected-windows nil
 custom-file (make-temp-file "")
 initial-frame-alist '((width . 125) (height . 30))
 default-frame-alist '((width . 125) (height . 30))
 ediff-window-setup-function 'ediff-setup-windows-plain
 frame-title-format '("%b - Emacs " emacs-version)
 gc-cons-threshold (* 100 1024 1024)
 history-delete-duplicates t
 history-length t
 inhibit-startup-screen t
 initial-scratch-message nil
 kill-whole-line t
 line-number-display-limit-width most-positive-fixnum
 load-prefer-newer t
 read-buffer-completion-ignore-case t
 recentf-max-saved-items nil
 require-final-newline t
 ring-bell-function #'ignore
 savehist-mode t
 save-interprogram-paste-before-kill t
 vc-follow-symlinks t)
(setq-default
 dired-listing-switches "-alh"
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

;;; Initial scratch mode
(setq-default initial-major-mode #'fundamental-mode)
