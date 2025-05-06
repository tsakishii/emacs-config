(setq package-install-upgrade-built-in t)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

;;; use-package setup
(package-initialize)

(eval-when-compile (require 'use-package))
(setq use-package-verbose t
      native-comp-async-report-warnings-errors nil)

(setq use-package-always-ensure t)

(setq package-install-upgrade-built-in t)

(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))

(provide 'init-package)
