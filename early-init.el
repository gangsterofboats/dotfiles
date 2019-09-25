;; -*- lexical-binding: t -*-

;; Package archives
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/") ; GNU
        ("melpa" . "https://melpa.org/packages/")  ; MELPA
        ("org" . "https://orgmode.org/elpa/")))    ; Org Mode
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t) ; MELPA
;; (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)     ; Org Mode

;; Package archives order
(setq package-archive-priorities
      '(("melpa" . 20)
        ("org" . 20)
        ("gnu" . 10)))

;; Other settings
(setq
 package-menu-async nil
 package-quickstart t)
(tool-bar-mode -1)
