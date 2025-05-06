;; -*- lexical-binding: t; -*-

(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  (vertico-resize t)
  (add-to-list 'vertico-multiform-categories '(embark-keybinding grid))
  (vertico-multiform-mode)
  :init
  (vertico-mode t)
  :config
  (setq enable-recursive-minibuffers t)
  (minibuffer-depth-indicate-mode 1))

(use-package orderless
  :ensure t
  :after vertico
  :commands (orderless)
  :custom (completion-styles '(orderless flex)))

(use-package consult
  :ensure t
  :after vertico
  :bind
  ("C-x b" . consult-buffer)
  ("C-s" . consult-line)
  :custom
  (completion-in-region-function #'consult-completion-in-region))

(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)
   :map minibuffer-local-map
   ("C-," . embark-act-all))
  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  ;(setq embark-prompter 'embark-completing-read-prompter)
  :custom
  (embark-indicators
   '(embark-minimal-indicator  ; default is embark-mixed-indicator
     embark-highlight-indicator
     embark-isearch-highlight-indicator)))

(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.6)
  (setq which-key-max-display-columns 3))

(provide 'init-interface)
