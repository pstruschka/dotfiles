;; -*- no-byte-compile: t; -*-
;;; tools/gtags/packages.el

(if (featurep! :completion ivy)
    (package! counsel-gtags)
  (if (featurep! :completion helm)
      (package! helm-gtags)
    (package! ggtags)))

(package! function-args)
