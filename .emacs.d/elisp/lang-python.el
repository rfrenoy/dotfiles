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

(use-package python-pytest
  :after (python-mode which-key)
  :custom
  (python-pytest-arguments
   '("--color"          ;; colored output in the buffer
     "--failed-first"   ;; run the previous failed tests first
     "--maxfail=5"))    ;; exit in 5 continuous failures in a run
  :config
  (which-key-declare-prefixes-for-mode 'python-mode "SPC pt" "Testing")
  (evil-leader/set-key-for-mode 'python-mode
    "ptp" 'python-pytest-popup
    "ptt" 'python-pytest
    "ptf" 'python-pytest-file
    "ptF" 'python-pytest-file-dwim
    "ptm" 'python-pytest-function
    "ptM" 'python-pytest-function-dwim
    "ptl" 'python-pytest-last-failed)
  )

(provide 'lang-python)
;;; lang-python ends here
