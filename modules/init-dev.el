;; -*- lexical-binding: t; -*-

(use-package lsp-tailwindcss
  :after lsp-mode
  :init
  (setq lsp-tailwindcss-add-on-mode t)
  :config
  (add-to-list 'lsp-tailwindcss-major-modes 'svelte-mode))

(use-package eglot
  :bind (:map eglot-mode-map
              ("C-c C-a" . eglot-code-actions)
              ("C-c C-r" . eglot-rename))
  :hook (((c-mode c++-mode) . eglot-ensure)
         (python-mode . eglot-ensure))
  :config
  (add-hook 'eglot-managed-mode-hook
          (lambda ()
            (setq eldoc-documentation-strategy (lambda (&rest _) nil)))))

(use-package svelte-mode
  :mode "\\.svelte\\'"
  :hook
  (svelte-mode . lsp-deferred)
  :config
  (setq svelte-basic-offset 2))

(use-package typescript-mode
  :mode "\\.tsx?\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2)
  (setq js-indent-level 2))

(use-package restclient)

(use-package js2-mode
    :mode (("\\.js\\'" . js2-mode)
           ("\\.jsx\\'" . js2-jsx-mode)))

(use-package js
  :mode ("\\.jsx?\\'" . js-mode)
  :config
  (setq js-indent-level 2))

(with-eval-after-load 'js
  (define-key js-mode-map (kbd "M-.") nil))

(defun ts-web-mode-config ()
  (setq web-mode-script-padding 2
        web-mode-style-padding 2
        web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))

(use-package web-mode
  :defer t
  :mode ("\\.html\\'"
         "\\.css\\'")
  :config (ts-web-mode-config))

(use-package sgml-mode
  :hook
  (html-mode . (lambda () (setq me/pretty-print-function #'sgml-pretty-print)))
  (html-mode . sgml-electric-tag-pair-mode)
  (html-mode . sgml-name-8bit-mode)
  :custom
  (sgml-basic-offset 2))

(use-package python
  :mode
  ("\\.py\\'" . python-mode)
  :interpreter
  ("python" . python-mode)
  :init
  (setq-default indent-tabs-mode nil)
  ;; :hook
  ;; (python-mode . eglot-ensure)
  ;; (python-mode . eldoc-mode)
  :config
  (setq python-indent-offset 4)
  (setq python-indent-guess-indent-offset nil))

(use-package pyvenv
  :after (eglot)
  :init
  ;; set the working home directory.
  ;; create 'versions' directory manualy.
  (setenv "WORKON_HOME" "~/.pyenv/versions"))

(use-package clojure-mode
  :config
  (add-hook 'clojure-mode-hook #'paredit-mode)
  (add-hook 'clojure-mode-hook #'subword-mode))

(use-package inf-clojure
  :config
  (add-hook 'inf-clojure-mode-hook #'paredit-mode))

(use-package cider
  :config
  (setq nrepl-log-messages nil)
  (setq nrepl-hide-special-buffers t)
  (setq cider-repl-clear-help-banner t)
  (setq cider-repl-display-help-banner nil)
  (setq cider-font-lock-dynamically '(macro core function var))
  (add-hook 'cider-repl-mode-hook #'paredit-mode))

(defun ts/go-mode-config ()
  (setq indent-tabs-mode t)
  (setq tab-width 8)
  (setq go-tab-width 8))

(use-package go-mode
  :hook
  (go-mode . ts/go-mode-config))

(use-package terraform-mode
  :config
  (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode))

(use-package yaml-mode
  :mode ("\\.yml\\'"
         "\\.yaml\\'")
  :config
   (define-key yaml-mode-map (kbd "C-o") 'newline-and-indent))

(use-package rasi-mode
  :mode "\\.rasi\\'")

;; json setup
(use-package json-mode
  :mode "\\.json$\\'")

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "markdown"))

(provide 'init-dev)
