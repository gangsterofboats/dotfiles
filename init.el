;;;; -*- lexical-binding: t -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs configuration -- init.el file                                      ;;
;; Copyright (C) 2025 Michael Wiseman                                       ;;
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

(use-package consult
  :bind
  (("C-x b" . consult-buffer)
   ("C-c l" . consult-goto-line)
   ("C-c f" . consult-line)))
(use-package csv-mode)
(use-package doom-modeline
  :init (doom-modeline-mode t)
  :config
  (setq
   doom-modeline-icon (display-graphic-p)
   doom-modeline-unicode-fallback t))
(use-package embark
  :bind
  (("C-." . embark-act)
   ("C-h B" . embark-bindings)))
(use-package embark-consult)
(use-package ergoemacs-mode
 :config
 (ergoemacs-mode t))
(use-package ergoemacs-mode)
(use-package expand-region
  :bind ("C-," . er/expand-region))
(use-package gnu-elpa-keyring-update)
(use-package helpful
  :bind
  (("C-h F" . helpful-function)
   ("C-h f" . helpful-callable)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)
   ("C-h x" . helpful-command)
   ("C-c C-d" . helpful-at-point)))
(use-package marginalia
  :init (marginalia-mode))
(use-package markdown-mode)
(use-package orderless
  :config (setq completion-styles '(orderless basic)))
(use-package rainbow-mode)
(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode t))
(use-package srcery-theme
  :config (load-theme 'srcery t))
(use-package undo-fu)
(use-package undo-fu-session
  :config (undo-fu-session-global-mode))
(use-package vertico
  :init
  (vertico-mode)
  (vertico-buffer-mode))
(use-package vundo)

;;;; Settings

;;; Backup settings
(setq
 auto-save-file-name-transforms `((".*" ,(expand-file-name "~/.local/share/emacs/save/") t))
 backup-by-copying t
 backup-directory-alist `(("." . ,(expand-file-name "~/.local/share/emacs/backup/")))
 delete-old-versions t
 kept-new-versions 10
 kept-old-versions 5
 undo-limit 134217728 ; 2^27
 undo-strong-limit 268435456 ; 2^28
 undo-outer-limit 1073741824 ; 2^30
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
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line))

;;; Line Numbers
(global-display-line-numbers-mode t)

;;; Set font
(set-face-font 'default "Cascadia Code NF-16")

;;; View Mode
(require 'view)
(global-set-key (kbd "C-x C-q") #'view-mode)

;;; Some keybindings
(global-set-key (kbd "C-'") #'comment-line)
(global-set-key (kbd "C-\"") #'comment-dwim)
(global-set-key (kbd "C-|") #'comment-box)
(global-set-key (kbd "M-!") #'shell-command)
(global-set-key (kbd "M-A") #'eval-expression)
(global-set-key (kbd "C-x C-d") #'dired) ; Switch these two.  Given buffer list keybindings, makes more sense
(global-set-key (kbd "C-x d") #'list-directory)
(global-set-key (kbd "C-x C-b") #'ibuffer)

;;; Other settings
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(blink-cursor-mode t)
(column-number-mode t)
(desktop-save-mode t)
(display-time-mode t)
(global-auto-revert-mode t)
(global-subword-mode t)
(pixel-scroll-precision-mode t)
(setq
 completion-cycle-threshold t
 completions-detailed t
 confirm-kill-emacs 'y-or-n-p
 cursor-in-non-selected-windows nil
 custom-file (expand-file-name "custom.el" user-emacs-directory)
 desktop-load-locked-desktop t
 display-time-default-load-average nil
 enable-recursive-minibuffers t
 initial-frame-alist '((width . 125) (height . 30))
 default-frame-alist '((width . 125) (height . 30))
 ediff-window-setup-function 'ediff-setup-windows-plain
 frame-title-format '("%b - Emacs " emacs-version)
 history-delete-duplicates t
 history-length t
 inhibit-startup-screen t
 initial-scratch-message nil
 kill-whole-line t
 line-number-display-limit-width most-positive-fixnum
 load-prefer-newer t
 package-install-upgrade-built-in t
 read-buffer-completion-ignore-case t
 recentf-max-saved-items nil
 require-final-newline t
 ring-bell-function #'ignore
 savehist-mode t
 save-interprogram-paste-before-kill t
 switch-to-buffer-obey-display-actions t
 tab-always-indent 'complete
 vc-follow-symlinks t)
(setq-default
 fill-column 80
 indent-tabs-mode nil
 indicate-buffer-boundaries 'left
 tab-width 4)
(show-paren-mode t)
(which-key-mode t)

;;;; Functions

;;; Disable themes function
(defun disable-all-themes ()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes))

;;;; Final settings

;;; Initial scratch mode
(setq-default initial-major-mode #'fundamental-mode)
