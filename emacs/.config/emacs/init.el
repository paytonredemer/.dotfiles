(setq package-archives 
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(setq use-package-always-ensure t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

(use-package doom-themes
  :config
  (load-theme `doom-one t))

(menu-bar-mode -1) 
(scroll-bar-mode -1) 
(tool-bar-mode -1)
(setq use-dialog-box nil)
(fringe-mode -1)

(setq inhibit-startup-screen t)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  ;; allows for using cgn
  ;; (setq evil-search-module 'evil-search)
  (setq evil-want-keybinding nil)
  ;; no vim insert bindings
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1))

;;; Vim Bindings Everywhere else
(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(use-package dashboard
  :ensure t
  :config
    (dashboard-setup-startup-hook)
    (setq dashboard-startup-banner "~/.config/emacs/img/emacs.png")
    (setq dashboard-items '((recents  . 5)
			    (bookmarks . 5)
			    (agenda . 5)
			    (projects . 5)))
    (setq dashboard-banner-logo-title "This is a test"))

(use-package org-tempo
  :ensure nil
  :after org
  :config
  (let ((templates '(("sh"  . "src sh")
                     ("el"  . "src emacs-lisp")
                     ("vim" . "src vim")
                     ("cpp" . "src C++ :includes <iostream>  :namespaces std"))))
    (dolist (template templates)
      (push template org-structure-template-alist))))

(use-package magit)
