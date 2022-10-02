;;;; -*- lexical-binding: t -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs configuration -- init.el file                                      ;;
;; Copyright (C) 2022 Michael Wiseman                                       ;;
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

;; Emacs Lisp
(use-package xah-elisp-mode)

;; Powershell
(use-package powershell)

;; Python
(use-package elpy)

;; Ruby
(use-package enh-ruby-mode
  :mode ("\\.rb\\'" . ruby-mode))

;; VimL/Vimscript
(use-package vimrc-mode)

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

;;; Local package
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
