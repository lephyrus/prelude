(require 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(setq markdown-command "pandoc -c file:///home/lrieder/.emacs.d/personal/github-pandoc.css --from gfm -t html5 --mathjax --highlight-style pygments --standalone --quiet")
