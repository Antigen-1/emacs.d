;;; init-local --- My own customizaion
;;; Commentary:

;;; Code:

;; Packages
;; ---------------------------
;; ----------------
;; Load and configure `use-package`
;; This is only needed once, near the top of the file
(eval-when-compile
  (add-to-list 'load-path (expand-file-name "use-package" user-emacs-directory))
  (require 'use-package)
  (require 'use-package-ensure)
  (setq use-package-always-ensure t))
;; ----------------

;; ----------------
;; Initialize the environment
(use-package exec-path-from-shell
             :config (exec-path-from-shell-initialize))
;; ----------------

;; ----------------
;; Automatically update packages
(use-package auto-package-update
  :commands (auto-package-update-now auto-package-update-now-async)
  :init
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t))
;; ----------------

;; ----------------
;; Racket
(use-package racket-mode
  :magic "#lang racket"
  :mode "\\.rkt\\'"
  :interpreter "racket"
  :commands racket-mode
  ;; Use `M-` as a common prefix
  ;; Major mode
  :bind ("M-r" . racket-mode)
  ;; Module environment
  :hook (racket-mode
         .
         (lambda () (define-key racket-mode-map (kbd "M-m") 'racket-run)))
  ;; Top-level environment
  :hook (racket-repl-mode
         .
         (lambda () (define-key racket-repl-mode-map (kbd "M-t") 'racket-repl-run)))
  :config
  ;; Semantic analysis
  (use-package racket-mode
    :commands racket-xp-mode
    :bind ("M-s" . racket-xp-mode)))
;; ----------------

;; ----------------
;; Pollen
(use-package pollen-mode
             :magic "#lang pollen"
             :mode "\\.p\\(m\\|md\\|p\\)?\\'"
             :commands pollen-mode)
;; ----------------

;; ----------------
;; Org
(use-package org
  :mode "\\.org\\'"
  :commands org-mode)
;; ----------------
;; ---------------------------

;; Others
;; ---------------------------
;; Use tab to do both completetion and indent
(setq tab-always-indent 'complete)
;; ---------------------------

(provide 'init-local)
;;; init-local.el ends here
