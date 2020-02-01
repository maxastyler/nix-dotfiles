;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; add the melpa repository 
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; Initialize package
(package-initialize)


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Autoload use-package
(eval-when-compile
  (require 'use-package))

;; Load the literate configuration
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("6973f93f55e4a6ef99aa34e10cd476bc59e2f0c192b46ec00032fe5771afd9ad" "179ff455fbab61b1c5be8da791c53c4a2b65598dc372031be1e95373bd9a1f25" default))
 '(package-selected-packages
   '(lsp-ivy lsp-mode treemacs-projectile treemacs poetry nix-mode poet-theme lispy yasnippet-snippets winum which-key undo-tree auctex rustic ripgrep rainbow-delimiters projectile org-ref org-bullets multi-term magit helm-swoop helm-bibtex helm flycheck eyebrowse async elpy dracula-theme doom-modeline company cider use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
