(require 'magit)

(with-eval-after-load 'magit
  (require 'forge)
  (setq magit-repository-directories
        '(;; Directory containing project root directories
          ("~/Code/"      . 2)
          ;; Specific project root directory
          ("~/.emacs.d/" . 1))))

(require 'bind-key)
;; remap keys shadowed by window navigation
(bind-keys* :map magit-mode-map
            ("C-1" . magit-section-show-level-1-all)
            ("C-2" . magit-section-show-level-2-all)
            ("C-3" . magit-section-show-level-3-all)
            ("C-4" . magit-section-show-level-4-all))
