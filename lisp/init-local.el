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
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))
;; ----------------

;; ----------------
;; Fira code
(use-package fira-code-mode
  :custom (fira-code-mode-disabled-ligatures '("[]" "x"))
  :hook prog-mode)
;; ----------------

;; ----------------
;; Racket
(use-package racket-mode
  :magic "#lang racket"
  :mode "\\.rkt\\'"
  :interpreter "racket"
  ;; Use `M-` as a common prefix
  ;; Major mode and minor mode
  :bind (("M-y" . racket-mode) ("M-e" . racket-xp-mode))
  ;; Module environment
  :hook (racket-mode
         .
         (lambda () (define-key racket-mode-map (kbd "M-m") 'racket-run)))
  ;; Top-level environment
  :hook (racket-repl-mode
         .
         (lambda () (define-key racket-repl-mode-map (kbd "M-t") 'racket-repl-run)))
  )
;; ----------------

;; ----------------
;; Pollen
(use-package pollen-mode
  :magic "#lang pollen"
  :mode "\\.p\\(m\\|md\\|p\\)?\\'"
  :commands pollen-mode)
;; ----------------

;; ----------------
;; Scribble
(use-package scribble-mode
  :magic "#lang scribble"
  :mode "\\.scrbl\\'"
  :commands scribble-mode)
;; ----------------

;; ----------------
;; Org
(use-package org
  :mode "\\.org\\'"
  :commands org-mode)
;; ----------------

;; ----------------
;;Completion
(use-package company
  :hook (text-mode . company-mode))
;; ----------------

;; ----------------
;; Haskell
(use-package lsp-mode
  :hook ((haskell-mode-hook haskell-literate-mode-hook) . lsp))
(use-package lsp-haskell :defer t)
;; ----------------
;; ---------------------------

;; Others
;; ---------------------------
;; Use tab to do both completetion and indent
(setq tab-always-indent 'complete)
;; ---------------------------

(provide 'init-local)
;;; init-local.el ends here
