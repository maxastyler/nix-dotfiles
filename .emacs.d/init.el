;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; add the melpa repository 
;; (require 'package)
;; (setq package-enable-at-startup nil)
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/"))
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t))
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
