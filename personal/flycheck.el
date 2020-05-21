(require 'flycheck)

(defun use-tslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (tslint (and root
                      (expand-file-name (if (eq system-type 'windows-nt)
                                            "node_modules/.bin/tslint.cmd"
                                          "node_modules/.bin/tslint")
                                        root))))
    (when (and tslint (file-executable-p tslint))
      (setq-local flycheck-typescript-tslint-executable tslint))))

(with-eval-after-load 'flycheck
  (global-flycheck-mode 1)
  (add-hook 'flycheck-mode-hook #'use-tslint-from-node-modules)
  (add-hook 'flycheck-mode-hook #'flycheck-elm-setup))

(eval-after-load 'flycheck
  '(setcar (memq 'source-inplace (flycheck-checker-get 'typescript-tslint 'command)) 'source-original))
