;; -*- lexical-binding: t; -*-

(use-package flycheck)

(use-package lsp-mode
  :commands lsp
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-enable-symbol-highlighting nil))

(use-package lsp-mode
  :defer t
  :commands lsp
  :init
  (setq lsp-keymap-prefix "C-c l") ;; Or 'C-l' , 's-l' or the other one
  :config
  (setq lsp-enable-which-key-integration t)
  (setq lsp-auto-guess-root nil)
  (setq lsp-prefer-flymake nil)
  (setq lsp-enable-file-watchers nil)
  (setq lsp-enable-folding nil)
  (setq read-process-output-max (* 1024 1024))
  (setq lsp-keep-workspace-alive nil)
  (setq lsp-eldoc-hook nil)
  (setq lsp-eldoc-enable-hover nil)
  :hook ((js2-jsx-mode
          svelte-mode
          js-mode
          js2-mode
          typescript-mode
          go-mode) . lsp-deferred)
  :custom
  (lsp-completion-provider :none)
  (lsp-headerline-breadcrumb-enable nil))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-doc-show-with-mouse t)
  (lsp-ui-doc-delay 0.8)
  (lsp-ui-sideline-show-hover nil))

(setq lsp-enable-links nil)

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config (dap-auto-configure-mode))

(use-package paredit
  :diminish paredit-mode
  :config
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  ;; enable in the *scratch* buffer
  (add-hook 'lisp-interaction-mode-hook #'paredit-mode)
  (add-hook 'clojure-mode-hook #'paredit-mode)
  (add-hook 'lisp-mode-hook #'paredit-mode))

(add-hook 'prog-mode-hook
          (lambda()
            (define-key prog-mode-map (kbd "M-;") #'comment-or-uncomment-region)))

(provide 'init-prog-conf)
