;; -*- lexical-binding: t; -*-

(setq eshell-prompt-function
      (lambda ()
        (concat "[" (getenv "USER") "@" (system-name) " "
                (eshell/pwd) "] " (if (= (user-uid) 0) "# " "λ "))))

(use-package eshell-syntax-highlighting
  :after eshell
  :demand t
  :config
  (eshell-syntax-highlighting-global-mode +1))

(provide 'kw-eshell)
