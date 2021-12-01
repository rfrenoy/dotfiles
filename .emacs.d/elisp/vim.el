(use-package evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package key-chord
	:config
	(setq key-chord-two-keys-delay 0.5)
	(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
	(key-chord-mode 1))
(provide 'vim)
;;; vim.el ends here
