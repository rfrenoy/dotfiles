(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                        (require 'lsp-pyright)
                        (lsp-deferred))))

(use-package python-mode
  :hook (python-mode . lsp-deferred)
  :custom
  (dap-python-debugger 'debugpy)
  :config
  (require 'dap-python)
)

(provide 'lang-python)
