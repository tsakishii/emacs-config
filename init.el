;;; init.el --- tsakishii -*- lexical-binding: t -*-
;; Copyright 2021-present, All rights reserved
;; Code licensed under the GNU GPL v.3 license

;; Author: tsakishii
;; URL: https://github.com/tsakishii/emacs-config

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This is my current Emacs configuration
;; Keep in mind that the configuration was tested and works
;; with GNU Emacs 29+

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:
(add-to-list 'load-path '"~/.emacs.d/modules")

;; Custom file setup
(setq custom-file
      (expand-file-name "~/.emacs.d/custom/custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

;; Set the right directory to store the native comp cache
(add-to-list 'native-comp-eln-load-path (expand-file-name "eln-cache/" user-emacs-directory))
(setq debug-on-error t)

(require 'init-package)
(require 'init-git)

(require 'init-core)
(require 'init-dev)
(require 'init-dired)
(require 'init-eshell)
(require 'init-interface)
(require 'init-org)
(require 'init-prog-conf)
(require 'init-theme)

;;; init.el ends here
