(require 'bind-key)
(require 'tonini-utils)
(require 'lephyrus-utils)

;; cursor movement
(bind-keys*
 ("M-j" . backward-char)
 ("M-l" . forward-char)
 ("M-i" . previous-line)
 ("M-k" . next-line)
 ("M-u" . backward-word)
 ("M-o" . forward-word)
 ("M-U" . backward-paragraph)
 ("M-O" . forward-paragraph)
 ("M-J" . beginning-of-line)
 ("M-L" . end-of-line)
 ("M-I" . scroll-down)
 ("M-K" . scroll-up)
 ("M-h" . beginning-of-buffer)
 ("M-H" . end-of-buffer))

;; window navigation
(bind-keys*
 ("C-d" . windmove-right)
 ("C-w" . windmove-up)
 ("C-s" . windmove-down)
 ("C-a" . windmove-left))

;; window organisation
(bind-keys*
 ("M-0" . delete-window)
 ("M-1" . zoom-window-zoom)
 ("M-2" . split-window-vertically)
 ("M-3" . split-window-horizontally)
 ("M-=" . balance-windows))

;; execute commands
(bind-key* "M-a" 'counsel-M-x)

;; buffers
(bind-keys*
 ("C-x b" . counsel-projectile)
 ("C-o" . counsel-find-file))

;; window configs
(bind-keys*
 ("C-M-," . eyebrowse-next-window-config)
 ("C-M-." . eyebrowse-prev-window-config))

;; jumping
(bind-keys
 ("M-*" . lephyrus-swipe-symbol-at-point))

;; selection
(bind-key* "M-SPC" 'set-mark-command)

;; misc
(bind-key "C-c C-k" 't-comment-or-uncomment-region-or-line)
(bind-key "C-SPC" 'company-complete)
(bind-key "<C-tab>" 't-indent-buffer)
(bind-key "M-RET" 'crux-smart-open-line)

(global-set-key (kbd "M-b") 'pop-to-mark-command)

(global-unset-key (kbd "C-<backspace>")) ; backward-kill-word
(global-unset-key (kbd "M-d")) ; kill-word

(global-unset-key (kbd "C-d")) ; delete-char
(global-set-key (kbd "M-d") 'delete-backward-char)
(global-set-key (kbd "M-f") 'delete-char)
(global-set-key (kbd "M-D") 'backward-kill-word)
(global-set-key (kbd "M-F") 'kill-word)
(global-set-key (kbd "<delete>") 'delete-char)

(global-unset-key (kbd "M-<")) ; beginning-of-buffer
(global-unset-key (kbd "M->")) ; end-of-buffer


(global-set-key (kbd "M-q") 'shell-command)

(global-unset-key (kbd "C-/")) ; undo
(global-unset-key (kbd "C-_")) ; undo
(global-set-key (kbd "M-z") 'undo)

(global-unset-key (kbd "M-w")) ; kill-ring-save
(global-unset-key (kbd "C-y")) ; yank
(global-unset-key (kbd "M-y")) ; yank-pop
(global-unset-key (kbd "C-r")) ; yank-pop
(global-set-key (kbd "M-x") 'kill-region)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-V") 'yank-pop)
(global-set-key (kbd "C-r d") 'kill-rectangle)

(global-unset-key (kbd "C-x C-f")) ; find-file
(global-unset-key (kbd "C-x h")) ; mark-whole-buffer
(global-unset-key (kbd "C-x C-w")) ; write-file

;; general
(global-set-key (kbd "M-r") 'replace-string)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-c k") 'kill-compilation)
(global-set-key (kbd "C-c w") 'delete-trailing-whitespace)

(global-unset-key (kbd "C-M-r")) ;; isearch-backwards
(global-set-key (kbd "C-f") 'isearch-forward-regexp)
(global-set-key (kbd "C-*") 'isearch-forward-at-point)

(global-set-key (kbd "C-c r") 'revert-buffer)

(define-key isearch-mode-map (kbd "M-v") 'isearch-yank-kill)
(define-key isearch-mode-map (kbd "M-w") 'isearch-query-replace)
(define-key isearch-mode-map (kbd "M-o") 'isearch-yank-word)
(define-key isearch-mode-map (kbd "M-l") 'isearch-yank-char)
(define-key isearch-mode-map (kbd "M-j") 'isearch-delete-char)
(define-key isearch-mode-map (kbd "M-u") 'isearch-delete-char)
(define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)

;; power-edit bundle bindings
(global-set-key (kbd "C-c u") 't-move-text-up)
(global-set-key (kbd "C-c n") 't-move-text-down)
(global-set-key (kbd "C-M-l")  'textmate-shift-right)
(global-set-key (kbd "C-M-j")  'textmate-shift-left)
(global-set-key (kbd "C-c C-w") 'whitespace-mode)

                                        ;(global-set-key (kbd "M-t") 'helm-projectile-find-file)

(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-x M-r") 'ruby-compilation-this-buffer)
(global-set-key (kbd "C-x M-k") 'kill-this-buffer)
(global-set-key (kbd "C-x t") 'dired-other-window)
(global-set-key (kbd "C-c C-c") 't-duplicate-current-line-or-region)

;; Help

(defvar lisp-find-map)
(define-prefix-command 'lisp-find-map)

(global-set-key (kbd "C-h e") 'lisp-find-map)

(global-set-key (kbd "C-h e c") 'finder-commentary)
(global-set-key (kbd "C-h e e") 'view-echo-area-messages)
(global-set-key (kbd "C-h e f") 'find-function)
(global-set-key (kbd "C-h e v") 'find-variable)
(global-set-key (kbd "C-h e F") 'find-face-definition)
(global-set-key (kbd "C-h e i") 'info-apropos)
(global-set-key (kbd "C-h e k") 'find-function-on-key)
(global-set-key (kbd "C-h e l") 'find-library)

(global-set-key (kbd "C-x p") 't-project-ido-find-project)

(global-set-key (kbd "C-/") 'company-complete)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "M-q") 't-shell-command)
(global-set-key (kbd "C-c M-d") 't-delete-current-buffer-file)

;; Traverse through buffers
(global-set-key (kbd "M->") 'next-buffer)
(global-set-key (kbd "M-<") 'previous-buffer)

;; Rectangle bindings
(global-set-key (kbd "C-x r M-i") 'string-insert-rectangle)


;; Helm
;; (global-set-key (kbd "M-a") 'helm-M-x)
;; (global-set-key (kbd "C-x C-m") 'helm-M-x)
;;(global-set-key (kbd "M-R") 'helm-show-kill-ring)
;;(global-set-key (kbd "C-x b") 'helm-mini)
;;(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
;;(global-set-key (kbd "C-x C-f") 'helm-find-files)
;;(global-set-key (kbd "C-h f") 'helm-apropos)
;;(global-set-key (kbd "C-h r") 'helm-info-emacs)
;;(global-set-key (kbd "C-h C-l") 'helm-locate-library)
;;(global-set-key (kbd "M-w") 'helm-imenu)
;;(global-set-key (kbd "C-o") 'helm-find-files)
;;(global-set-key (kbd "M-g a") 'helm-projectile-ag)
;;(global-unset-key (kbd "C-x c"))

(define-key process-menu-mode-map (kbd "C-k") 't-delete-process-at-point)
(define-key minibuffer-local-map (kbd "M-v") 'yank)

;; Search
;;(global-set-key (kbd "C-x M-a") 'helm-do-ag)
;;(global-set-key (kbd "C-x M-q") 'helm-ag)
;;(global-set-key (kbd "C-x M-p") 'helm-swoop)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
(global-set-key (kbd "C-x M-l") 'magit-log)
(global-set-key (kbd "C-x M-b") 'magit-blame)

;; swap `transpose-chars' key with `transpose-lines'
(global-set-key "\C-t" #'transpose-lines)
(define-key ctl-x-map "\C-t" #'transpose-chars)

;; Custom interactive functions
(global-set-key (kbd "C-x M-o") 't-open-in-desktop)

;; Better bindings for scrolling in other window
(global-set-key (kbd "C-M-n") 'scroll-other-window)
(global-set-key (kbd "C-M-p") 'scroll-other-window-down)
