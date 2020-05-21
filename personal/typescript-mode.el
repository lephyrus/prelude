(require 'typescript-mode)
(require 'prettier-js)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

(defun hook-fns ()
  (setup-iosevka-ligatures)
  (add-node-modules-path)
  (prettier-js-mode))


(eval-after-load 'typescript-mode
  '(add-hook 'typescript-mode-hook 'hook-fns))
