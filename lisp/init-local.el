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
;; Global package configuration
(use-package auto-package-update
             :config
             (setq auto-package-update-delete-old-versions t)
             (setq auto-package-update-hide-results t)
             (auto-package-update-maybe))
(use-package exec-path-from-shell
             :config (exec-path-from-shell-initialize))
;; ----------------

;; ----------------
;; Racket
(use-package racket-mode
             :magic "#lang"
             :mode "\\.rkt\\"
             :interpreter "racket"
             :commands racket-mode
             ;; Use `C-r` as a common prefix
             :bind ("C-r" . racket-mode)
             ;; Module environment
             :hook (racket-mode
                    .
                    (lambda () (define-key racket-mode-map (kbd "C-r m") 'racket-run)))
             ;; Top-level environment
             :hook (racket-repl-mode
                    .
                    (lambda () (define-key racket-repl-mode-map (kbd "C-r t") 'racket-repl-run)))
             :config
             ;; Semantic analysis
             (use-package racket-xp-mode
                          :commands racket-xp-mode
                          :bind ("C-r x" . racket-xp-mode)))
;; ----------------
;; ---------------------------

;; Others
;; ---------------------------
;; Use tab to do both completetion and indent
(setq tab-always-indent 'complete)
;; ---------------------------

(provide 'init-local)
;;; init-local.el ends here
