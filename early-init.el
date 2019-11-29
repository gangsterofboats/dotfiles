;;;; -*- lexical-binding: t -*-
;;;; Emacs configuration -- early-init.el file
;;;; Copyright (C) 2019 Michael Wiseman
;;;; 
;;;; This program is free software: you can redistribute it and/or modify
;;;; it under the terms of the GNU Affero General Public License as
;;;; published by the Free Software Foundation, either version 3 of the
;;;; License, or (at your option) any later version.
;;;; 
;;;; This program is distributed in the hope that it will be useful,
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;; GNU Affero General Public License for more details.
;;;; 
;;;; You should have received a copy of the GNU Affero General Public License
;;;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; FIX for something
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;;; Package archives
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/") ; GNU
        ("melpa" . "https://melpa.org/packages/")  ; MELPA
        ("org" . "https://orgmode.org/elpa/")))    ; Org Mode
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t) ; MELPA
;; (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)     ; Org Mode

;;; Package archives order
(setq package-archive-priorities
      '(("melpa" . 20)
        ("org" . 20)
        ("gnu" . 10)))

;;; Other settings
(setq
 package-menu-async nil
 package-quickstart t)
(tool-bar-mode -1)
