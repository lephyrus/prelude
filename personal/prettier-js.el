(require 'typescript-mode)
(require 'js2-mode)
(require 'web-mode)

(add-hook 'typescript-mode-hook #'prettier-js-mode)
(add-hook 'js2-mode-hook #'prettier-js-mode)
(add-hook 'web-mode-hook #'prettier-js-mode)
