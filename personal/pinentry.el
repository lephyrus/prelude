(require 'epa)
(require 'pinentry)

;; https://emacs.stackexchange.com/questions/32881/enabling-minibuffer-pinentry-with-emacs-25-and-gnupg-2-1-on-ubuntu-xenial
(setq epa-pinentry-mode 'loopback)
(pinentry-start)
