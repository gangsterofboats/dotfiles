; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/")) ; MELPA
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")) ; Marmalade
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org Mode
(add-to-list 'package-archives '("SC" . "http://joseito.republika.pl/sunrise-commander/")) ; Sunrise Commander
(package-initialize)

; Package archive order
(setq package-archive-priorities
      '(("melpa" . 30)
        ("org" . 30)
        ("SC" . 30)
        ("marmalade" . 20)
        ("melpa-stable" . 20)
        ("gnu" . 10)))

; Set starting directory
;(cd (getenv "HOMEPATH"))
;(setq default-directory (expand-file-name "~/"))

; Add directory to load path
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/"))

; Set color theme
(load-theme 'noctilux t)

; Set font
(set-face-attribute 'default nil :font "Consolas-12")

; Garbage Collection
(add-hook 'focus-out-hook #'garbage-collect)

; Amx
(amx-initialize)
(amx-mode 1)
(setq amx-prompt-string "Alt-a ")

; Emmet Mode
(add-hook 'sgml-mode-hook #'emmet-mode)
(add-hook 'css-mode-hook #'emmet-mode)

; Ergoemacs
(require 'ergoemacs-mode)
(setq
 ergoemacs-theme nil
 ergoemacs-keyboard-layout "us")
(ergoemacs-mode 1)
(global-set-key (kbd "M-n") #'ergoemacs-beginning-or-end-of-buffer) ; M-n is quit for some reason

; Hippie Expand
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

; Helm
(require 'helm-config)
(require 'helm-swoop)
(global-set-key (kbd "M-a") #'helm-M-x)
(global-set-key (kbd "C-o") #'helm-find-files)
(global-set-key (kbd "C-f") #'helm-swoop)
(helm-mode 1)

; Helpful
(global-set-key (kbd "C-h f") #'helpful-callable)
(global-set-key (kbd "C-h v") #'helpful-variable)
(global-set-key (kbd "C-h k") #'helpful-key)
(global-set-key (kbd "C-c C-d") #'helpful-at-point)

; Hydra
;; Dired
(defhydra hydra-dired (:hint nil :color pink)
  "
_+_ mkdir          _v_iew           _m_ark             _(_ details        _i_nsert-subdir    wdired
_C_opy             _O_ view other   _U_nmark all       _)_ omit-mode      _$_ hide-subdir    C-x C-q : edit
_D_elete           _o_pen other     _u_nmark           _l_ redisplay      _w_ kill-subdir    C-c C-c : commit
_R_ename           _M_ chmod        _t_oggle           _g_ revert buf     _e_ ediff          C-c ESC : abort
_Y_ rel symlink    _G_ chgrp        _E_xtension mark   _s_ort             _=_ pdiff
_S_ymlink          ^ ^              _F_ind marked      _._ toggle hydra   \\ flyspell
_r_sync            ^ ^              ^ ^                ^ ^                _?_ summary
_z_ compress-file  _A_ find regexp
_Z_ compress       _Q_ repl regexp

T - tag prefix
"
  ("\\" dired-do-ispell)
  ("(" dired-hide-details-mode)
  (")" dired-omit-mode)
  ("+" dired-create-directory)
  ("=" diredp-ediff)         ;; smart diff
  ("?" dired-summary)
  ("$" diredp-hide-subdir-nomove)
  ("A" dired-do-find-regexp)
  ("C" dired-do-copy)        ;; Copy all marked files
  ("D" dired-do-delete)
  ("E" dired-mark-extension)
  ("e" dired-ediff-files)
  ("F" dired-do-find-marked-files)
  ("G" dired-do-chgrp)
  ("g" revert-buffer)        ;; read all directories again (refresh)
  ("i" dired-maybe-insert-subdir)
  ("l" dired-do-redisplay)   ;; relist the marked or singel directory
  ("M" dired-do-chmod)
  ("m" dired-mark)
  ("O" dired-display-file)
  ("o" dired-find-file-other-window)
  ("Q" dired-do-find-regexp-and-replace)
  ("R" dired-do-rename)
  ("r" dired-do-rsynch)
  ("S" dired-do-symlink)
  ("s" dired-sort-toggle-or-edit)
  ("t" dired-toggle-marks)
  ("U" dired-unmark-all-marks)
  ("u" dired-unmark)
  ("v" dired-view-file)      ;; q to exit, s to search, = gets line #
  ("w" dired-kill-subdir)
  ("Y" dired-do-relsymlink)
  ("z" diredp-compress-this-file)
  ("Z" dired-do-compress)
  ("q" nil)
  ("." nil :color blue))
(eval-after-load "dired"
  #'(progn
      (define-key dired-mode-map "." #'hydra-dired/body)))

;; IBuffer
(defhydra hydra-ibuffer-main (:color pink :hint nil)
  "
 ^Navigation^ | ^Mark^        | ^Actions^        | ^View^
-^----------^-+-^----^--------+-^-------^--------+-^----^-------
  _k_:    ʌ   | _m_: mark     | _D_: delete      | _g_: refresh
 _RET_: visit | _u_: unmark   | _S_: save        | _s_: sort
  _j_:    v   | _*_: specific | _a_: all actions | _/_: filter
-^----------^-+-^----^--------+-^-------^--------+-^----^-------
"
  ("j" ibuffer-forward-line)
  ("RET" ibuffer-visit-buffer :color blue)
  ("k" ibuffer-backward-line)

  ("m" ibuffer-mark-forward)
  ("u" ibuffer-unmark-forward)
  ("*" hydra-ibuffer-mark/body :color blue)

  ("D" ibuffer-do-delete)
  ("S" ibuffer-do-save)
  ("a" hydra-ibuffer-action/body :color blue)

  ("g" ibuffer-update)
  ("s" hydra-ibuffer-sort/body :color blue)
  ("/" hydra-ibuffer-filter/body :color blue)

  ("o" ibuffer-visit-buffer-other-window "other window" :color blue)
  ("q" quit-window "quit ibuffer" :color blue)
  ("." nil "toggle hydra" :color blue))

(defhydra hydra-ibuffer-mark (:color teal :columns 5
                                     :after-exit (hydra-ibuffer-main/body))
  "Mark"
  ("*" ibuffer-unmark-all "unmark all")
  ("M" ibuffer-mark-by-mode "mode")
  ("m" ibuffer-mark-modified-buffers "modified")
  ("u" ibuffer-mark-unsaved-buffers "unsaved")
  ("s" ibuffer-mark-special-buffers "special")
  ("r" ibuffer-mark-read-only-buffers "read-only")
  ("/" ibuffer-mark-dired-buffers "dired")
  ("e" ibuffer-mark-dissociated-buffers "dissociated")
  ("h" ibuffer-mark-help-buffers "help")
  ("z" ibuffer-mark-compressed-file-buffers "compressed")
  ("b" hydra-ibuffer-main/body "back" :color blue))

(defhydra hydra-ibuffer-action (:color teal :columns 4
                                       :after-exit
                                       (if (eq major-mode 'ibuffer-mode)
                                           (hydra-ibuffer-main/body)))
  "Action"
  ("A" ibuffer-do-view "view")
  ("E" ibuffer-do-eval "eval")
  ("F" ibuffer-do-shell-command-file "shell-command-file")
  ("I" ibuffer-do-query-replace-regexp "query-replace-regexp")
  ("H" ibuffer-do-view-other-frame "view-other-frame")
  ("N" ibuffer-do-shell-command-pipe-replace "shell-cmd-pipe-replace")
  ("M" ibuffer-do-toggle-modified "toggle-modified")
  ("O" ibuffer-do-occur "occur")
  ("P" ibuffer-do-print "print")
  ("Q" ibuffer-do-query-replace "query-replace")
  ("R" ibuffer-do-rename-uniquely "rename-uniquely")
  ("T" ibuffer-do-toggle-read-only "toggle-read-only")
  ("U" ibuffer-do-replace-regexp "replace-regexp")
  ("V" ibuffer-do-revert "revert")
  ("W" ibuffer-do-view-and-eval "view-and-eval")
  ("X" ibuffer-do-shell-command-pipe "shell-command-pipe")
  ("b" nil "back"))

(defhydra hydra-ibuffer-sort (:color amaranth :columns 3)
  "Sort"
  ("i" ibuffer-invert-sorting "invert")
  ("a" ibuffer-do-sort-by-alphabetic "alphabetic")
  ("v" ibuffer-do-sort-by-recency "recently used")
  ("s" ibuffer-do-sort-by-size "size")
  ("f" ibuffer-do-sort-by-filename/process "filename")
  ("m" ibuffer-do-sort-by-major-mode "mode")
  ("b" hydra-ibuffer-main/body "back" :color blue))

(defhydra hydra-ibuffer-filter (:color amaranth :columns 4)
  "Filter"
  ("m" ibuffer-filter-by-used-mode "mode")
  ("M" ibuffer-filter-by-derived-mode "derived mode")
  ("n" ibuffer-filter-by-name "name")
  ("c" ibuffer-filter-by-content "content")
  ("e" ibuffer-filter-by-predicate "predicate")
  ("f" ibuffer-filter-by-filename "filename")
  (">" ibuffer-filter-by-size-gt "size")
  ("<" ibuffer-filter-by-size-lt "size")
  ("/" ibuffer-filter-disable "disable")
  ("b" hydra-ibuffer-main/body "back" :color blue))
(eval-after-load "ibuffer"
  #'(progn
      (define-key ibuffer-mode-map "." #'hydra-ibuffer-main/body)))
;(add-hook 'ibuffer-hook #'hydra-ibuffer-main/body)

; Linum / Line Numbers
;; (global-linum-mode t)
;; (set-face-attribute 'linum nil :box nil :slant 'normal) ; have to set this after loading theme
(global-display-line-numbers-mode t)

; Remap Windows key to Super
;; (setq w32-pass-lwindow-to-system nil)
;; (setq w32-lwindow-modifier 'super)
;; (setq w32-pass-rwindow-to-system nil)
;; (setq w32-rwindow-modifier 'super)

; Smart Mode Line
(sml/setup)

; Smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

; Settings
(column-number-mode t)
(display-time-mode t)
(electric-pair-mode t)
(global-set-key (kbd "C-'") #'comment-line)
(global-set-key (kbd "C-^") #'yas-global-mode)
(global-set-key (kbd "C-|") #'comment-box)
(global-set-key (kbd "M-!") #'shell-command)
(global-set-key (kbd "M-A") #'amx-major-mode-commands)
(global-set-key (kbd "M-F") #'zap-to-char)
(global-subword-mode t)
(global-undo-tree-mode t)
(prefer-coding-system 'utf-8-unix)
(scroll-bar-mode -1)
(set-default-coding-systems 'utf-8)
(set-language-environment "UTF-8")
(setq
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
 ;show-trailing-whitespace t
 tab-width 4)
(show-paren-mode t)

; Misellaneous requires
(require 'dired+)
(require 'ls-lisp+)

; YAScroll
(global-yascroll-bar-mode t)
(setq yascroll:delay-to-hide nil)

; Disable themes function
(defun disable-all-themes ()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes))
(defalias #'dat #'disable-all-themes)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(background-color "#202020")
 '(background-mode dark)
 '(beacon-color "#f2777a")
 '(compilation-message-face 'default)
 '(cursor-color "#cccccc")
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "408e753da5ce585ad73a0388b50749ef4dcf2b047583fb1378516576e40fa71b" "0e6e456b15dbeb6e7bcad4131f029e027cceecc3cf1598fc49141343860bfce6" "6ee6f99dc6219b65f67e04149c79ea316ca4bcd769a9e904030d38908fd7ccf9" "d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "d3a406c5905923546d8a3ad0164a266deaf451856eca5f21b36594ffcb08413a" "4980e5ddaae985e4bae004280bd343721271ebb28f22b3e3b2427443e748cd3f" "5b6b9c2f0121417faa3f69924b2643656cd429044f956bfa5328000b21d78dc9" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
 '(fci-rule-color "#424748")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(foreground-color "#cccccc")
 '(highlight-changes-colors '("#ff8eff" "#ab7eff"))
 '(highlight-tail-colors
   '(("#424748" . 0)
     ("#63de5d" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#424748" . 100)))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   '(panda-theme crystal-mode lua-mode powershell ess yasnippet yascroll unbound smartparens smart-mode-line rainbow-mode racket-mode perl6-mode paradox org nov noctilux-theme monokai-theme markdown-mode julia-mode helpful help-fns+ helm-swoop haskell-mode go-mode fzf free-keys fountain-mode files+ erlang ergoemacs-mode emmet-mode dired+ d-mode amx alchemist))
 '(paradox-github-token t)
 '(pos-tip-background-color "#E6DB74")
 '(pos-tip-foreground-color "#242728")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#ff0066")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#63de5d")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#53f2dc")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#06d8ff")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#242728" "#424748" "#F70057" "#ff0066" "#86C30D" "#63de5d" "#BEB244" "#E6DB74" "#40CAE4" "#06d8ff" "#FF61FF" "#ff8eff" "#00b2ac" "#53f2dc" "#f8fbfc" "#ffffff")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
