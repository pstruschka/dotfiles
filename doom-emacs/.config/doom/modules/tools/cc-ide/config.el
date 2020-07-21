;;; tools/gtags/config.el -*- lexical-binding: t; -*-

(use-package! ggtags
  :unless (or (featurep! :completion ivy) (featurep! :completion helm))
  :config
  (add-hook! (c-mode c++-mode java-mode asm-mode) (ggtags-mode 1))
  (map! :map ggtags-mode-map
        "C-c g s" 'ggtags-find-other-symbol
        "C-c g h" 'ggtags-view-tag-history
        "C-c g r" 'ggtags-find-reference
        "C-c g f" 'ggtags-find-file
        "C-c g c" 'ggtags-create-tags
        "C-c g u" 'ggtags-update-tags
        "M-," 'pop-tag-mark)
  (setq-hook! 'ggtags-mode-hook imenu-create-index-function 'ggtags-build-imenu-index)
  )

(use-package! helm-gtags
  :when (featurep! :completion helm)
  :after helm
  :init
  (setq! helm-gtags-ignore-case t
         helm-gtags-auto-update t
         helm-gtags-use-input-at-cursor t
         helm-gtags-pulse-at-cursor t
         helm-gtags-prefix-key "\C-cg"
         helm-gtags-suggested-key-mapping t)
  :config
  (add-hook! (dired-mode eshell-mode c-mode c++-mode asm-mode) (helm-gtags-mode))
  (map! :map helm-gtags-mode-map
        "C-c g a" 'helm-gtags-tags-in-this-function
        "C-j" 'helm-gtags-select
        "M-." 'helm-gtags-dwim
        "M-," 'helm-gtags-pop-stack
        "C-c <" 'helm-gtags-previous-history
        "C-c >" 'helm-gtags-next-history)
  )

(use-package! counsel-gtags
  :when (featurep! :completion ivy)
  :after ivy
  :config
  (add-hook! (c-mode c++-mode asm-mode) #'counsel-gtags-mode)
  (map! :map counsel-gtags-mode-map
        "C-c g t" 'counsel-gtags-find-definition
        "C-c g r" 'counsel-gtags-find-reference
        "C-c g s" 'counsel-gtags-find-symbol
        "C-c g f" 'counsel-gtags-find-file
        "C-c g c" 'counsel-gtags-create-tags
        "C-c g u" 'counsel-gtags-update-tags
        "M-," 'counsel-gtags-dwim
        "C-c <" 'counsel-gtags-go-backward
        "C-c >" 'counsel-gtags-go-forward)
  )

(use-package! function-args
  :init
  (setq-default semantic-case-fold t)
  :config
  (add-hook! (c-mode c++-mode asm-mode) #'function-args-mode)
  )
