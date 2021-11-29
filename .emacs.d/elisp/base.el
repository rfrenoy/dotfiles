;; Add package repositories
(require 'package)
;; (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;; Custom file, avoid emacs making change to init.el automatically
(defvar alpha2phi/custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Emacs customizations
;; Disable backup files
;; Display relative line numbers
;; Ensure new packages are automatically installed
(setq custom-file                        alpha2phi/custom-file
      make-backup-files                  nil
      display-line-numbers-type          'relative
      ; inhibit-startup-message            t
      use-package-always-ensure          t)

;; Display line number
(global-display-line-numbers-mode)

;; Show matching parentheses
(show-paren-mode 1)

;; Disable menubar, toolbar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Need to load custom file to avoid being overwritten
;; more at https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Customizations.html
(if (file-exists-p alpha2phi/custom-file)
  (load custom-file))

(provide 'base)
