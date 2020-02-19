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
;; expand the symlink first so that it gets the right date
(org-babel-load-file (file-truename
                      (expand-file-name
                       "config.org"
                       user-emacs-directory)))
