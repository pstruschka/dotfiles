(require 'package)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ; (add-to-list 'package-archives (cons "marmalade" (concat proto "://marmalade-repo.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "org" (concat proto "://orgmode.org/elpa/")) t)
  (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/"))))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq package-load-list '(all))
(unless (package-installed-p 'org)
  (package-install 'org))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(package-initialize)


(require 'org)

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("44961a9303c92926740fc4121829c32abca38ba3a91897a4eab2aa3b7634bed4" "fede08d0f23fc0612a8354e0cf800c9ecae47ec8f32c5f29da841fe090dfc450" "8e51e44e5b079b2862335fcc5ff0f1e761dc595c7ccdb8398094fb8e088b2d50" "7559ac0083d1f08a46f65920303f970898a3d80f05905d01e81d49bb4c7f9e39" default)))
 '(package-selected-packages
   (quote
    (docker dockerfile-mode racer yaml-mode pkgbuild-mode zenburn-theme color-theme-modern base16-theme spacemacs-theme dumb-jump which-key use-package undo-tree try treemacs-projectile spaceline smartparens rainbow-delimiters org-plus-contrib nlinum magit ivy-hydra iedit fzf flycheck expand-region exec-path-from-shell doom-modeline diminish counsel-projectile company color-theme-sanityinc-solarized aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
