;;;; Packages

;;; Package manager settings
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t) ; MELPA
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)     ; Org Mode
(unless package--initialized (package-initialize))

;;; Package archives order
(setq package-archive-priorities
      '(("melpa" . 20)
        ("org" . 20)
        ("gnu" . 10)))

;;; Enable Leaf
(unless (package-installed-p 'leaf)
  (package-refresh-contents)
  (package-install 'leaf))
(eval-when-compile
  (require 'leaf))

;;; Packages
(leaf adoc-mode :ensure t)
(leaf alchemist :ensure t)
(leaf cc-mode
  :ensure t
  :config
  (setq c-default-style "bsd")
  (setq-default c-basic-offset 4))
(leaf cobol-mode
  :ensure t
  :config
  (setq
   cobol-format-style 'lower-case
   cobol-source-format 'free))
(leaf crystal-mode :ensure t)
(leaf csv-mode :ensure t)
(leaf d-mode :ensure t)
(leaf darkokai-theme :ensure t)
(leaf emmet-mode
  :ensure t
  :hook ((sgml-mode . css-mode)))
(leaf ergoemacs-mode
  :ensure t
  :leaf-defer nil
  :config
  (ergoemacs-mode t)
  (setq
   ergoemacs-theme nil
   ergoemacs-keyboard-layout "us"))
(leaf erlang :ensure t)
(leaf ess :ensure t)
(leaf expand-region
  :ensure t
  :bind (("C-," . er/expand-region)))
(leaf fountain-mode :ensure t)
(leaf go-mode :ensure t)
(leaf haskell-mode :ensure t)
(leaf helm
  :ensure t
  :leaf-defer nil
  :config (helm-mode t))
(leaf helm-swoop
  :after ergoemacs-mode
  :ensure t
  :bind (("C-f" . helm-swoop)))
(leaf helpful
  :ensure t
  :bind
  (("C-h f" . helpful-callable)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)
   ("C-c C-d" . helpful-at-point)))
(leaf js2-mode
  :ensure t
  :mode ("\\.js$" . js2-mode)
  :config
  (setq
   js-indent-level 4
   js2-indent-level 4
   js2-basic-offset 4))
(leaf json-mode :ensure t)
(leaf julia-mode :ensure t)
(leaf lua-mode :ensure t)
(leaf markdown-mode :ensure t)
(leaf nim-mode :ensure t)
(leaf noctilux-theme :ensure t)
(leaf nov :ensure t)
(leaf org
  :ensure t
  :init (leaf org-plus-contrib  :ensure t)
  :config (setq org-export-backends '(ascii groff html icalendar latex man md odt org texinfo)))
(leaf ox-asciidoc :ensure t)
(leaf ox-rst :ensure t)
(leaf paradox
  :ensure t
  :config
  (setq
   paradox-execute-asynchronously nil
   paradox-github-token t))
(leaf perl6-mode :ensure t)
(leaf powershell :ensure t)
(leaf racket-mode :ensure t)
(leaf rainbow-mode :ensure t)
(leaf rust-mode :ensure t)
(leaf sly :ensure t)
(leaf smalltalk-mode :ensure t)
(leaf smart-mode-line
  :ensure t
  :init (add-hook 'after-init-hook #'sml/setup)
  :config (setq sml/no-confirm-load-theme t))
(leaf smartparens
  :ensure t
  :config (smartparens-global-mode t))
(leaf sql-indent :ensure t)
(leaf srcery-theme :ensure t)
(leaf tide :ensure t)
(leaf tuareg :ensure t)
(leaf vimrc-mode :ensure t)
(leaf xah-elisp-mode :ensure t)
(leaf yaml-mode :ensure t)
(leaf yasnippet
  :ensure t
  :bind (("C-^" . yas-global-mode)))
(leaf yasnippet-snippets :ensure t)
(leaf zerodark-theme :ensure t)
(leaf zig-mode :ensure t)

;;; Local packages
(leaf arc
  :load-path `,(expand-file-name "lisp/arc.el" user-emacs-directory)
  :mode ("\\.arc$" . arc-mode))

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

;;; CPerl settings
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))
(setq
 cperl-brace-offset 0
 cperl-continued-brace-offset -4
 cperl-continued-statement-offset 4
 cperl-extra-newline-before-brace t
 cperl-hairy t
 cperl-highlight-variables-indiscriminately t
 cperl-indent-level 4
 cperl-indent-wrt-brace nil
 cperl-label-offset -4
 cperl-merge-trailing-else nil)

;;; Ensure UTF-8 usage
(prefer-coding-system 'utf-8-unix)
(set-charset-priority 'unicode)
(set-keyboard-coding-system 'utf-8)
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
(set-face-font 'default "Hack-12")

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
(display-time-mode t)
(global-subword-mode t)
(global-undo-tree-mode t)
(setq
 cursor-in-non-selected-windows nil
 custom-file (expand-file-name "~/.custom.el") ; (setq custom-file (make-temp-file ""))
 initial-frame-alist '((width . 125) (height . 30) (vertical-scroll-bars . nil))
 default-frame-alist '((width . 125) (height . 30) (vertical-scroll-bars . nil))
 frame-title-format '("" "%b - Emacs " emacs-version)
 gc-cons-threshold (* 100 1024 1024)
 history-delete-duplicates t
 history-length t ; history-length 1000
 inhibit-startup-screen t
 load-prefer-newer t
 read-buffer-completion-ignore-case t
 require-final-newline t
 ring-bell-function #'ignore
 vc-follow-symlinks t)
(setq-default
 fill-column 80
 indent-tabs-mode nil
 lexical-binding t
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
