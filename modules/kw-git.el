;; -*- lexical-binding: t; -*-

(use-package magit
  :ensure t
  :defer t
  :diminish magit-auto-revert-mode
  :bind ("C-x g" . magit-status))

(provide 'kw-git)
