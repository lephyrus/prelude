(require 'projectile)

;; faster indexing on windows
;; (setq projectile-indexing-method 'alien)

(with-eval-after-load 'projectile
  (when (require 'magit nil t)
    (mapc #'projectile-add-known-project
          (mapcar #'file-name-as-directory (magit-list-repos)))
    ;; Optionally write to persistent `projectile-known-projects-file'
    (projectile-save-known-projects)))

(require 'bind-key)
;; use "C-p" (in addition to the "C-c p" default)
(bind-keys :map projectile-mode-map
           ("C-p" . projectile-command-map))
