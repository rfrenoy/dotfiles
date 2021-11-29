(use-package evil
  :init
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1))
(use-package key-chord
	:config
	(setq key-chord-two-keys-delay 0.5)
	(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
	(key-chord-mode 1))
(provide 'vim)
;;; vim.el ends here
