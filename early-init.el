;;;; -*- lexical-binding: t -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs configuration -- early-init.el file                                ;;
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

;;; Package archives
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/devel/")              ; GNU
        ("nongnu" . "https://elpa.nongnu.org/nongnu-devel/") ; NonGNU
        ("melpa" . "https://melpa.org/packages/")))          ; MELPA

;;; Package archives order
(setq package-archive-priorities
      '(("melpa" . 20)
        ("gnu" . 10)
        ("nongnu" . 10)))

;;; Other settings
(setq
 gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"
 package-user-dir (expand-file-name "~/.local/share/emacs/packages/"))
(tool-bar-mode -1)
