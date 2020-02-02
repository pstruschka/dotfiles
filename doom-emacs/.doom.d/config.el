(setq
 doom-font (font-spec :family "Fira Code" :size 14)
 doom-big-font (font-spec :family "Fira Code" :size 24)
 doom-variable-pitch-font (font-spec :family "Fira Code" :size 16))

(setq projectile-project-search-path '("~/Documents/Work" "~/code"))

(setq display-line-numbers-type 'relative)

(add-hook 'org-mode-hook #'auto-fill-mode)

(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup
        ))

(after! org
  (setq org-capture-templates '(("t" "Personal todo" entry
    (file+headline +org-capture-todo-file "Inbox")
    "* TODO %?\n%i\n%a" :prepend t :kill-buffer t)
   ("n" "Personal notes" entry
    (file+headline +org-capture-notes-file "Inbox")
    "* %u %?\n%i\n%a" :prepend t :kill-buffer t)
   ("p" "Templates for projects")
   ("pt" "Project todo" entry
    (file+headline +org-capture-project-todo-file "Inbox")
    "* TODO %?\n%i\n%a" :prepend t :kill-buffer t)
   ("pn" "Project notes" entry
    (file+headline +org-capture-project-notes-file "Inbox")
    "* TODO %?\n%i\n%a" :prepend t :kill-buffer t)
   ("pc" "Project changelog" entry
    (file+headline +org-capture-project-notes-file "Unreleased")
    "* TODO %?\n%i\n%a" :prepend t :kill-buffer t))))

(use-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                         :time-grid t
                                         :scheduled today)
                                  (:name "Due today"
                                         :deadline today)
                                  (:name "Important"
                                         :priority "A")
                                  (:name "Overdue"
                                         :deadline past)
                                  (:name "Due soon"
                                         :deadline future)
                                  (:name "Big Outcomes"
                                         :tag "bo")))
  :config
  (org-super-agenda-mode)
)

(setq imenu-anywhere-delimiter ": ")

(add-hook 'imenu-after-jump-hook #'better-jumper-set-jump)

(after! imenu-list
  (setq imenu-list-idle-update-delay 0.5)

  (set-popup-rule! "^\\*Ilist"
    :side 'right :size 35 :quit nil :select nil :ttl 0))

;;(map! :leader
;;      (:prefix-map ("/" . "search"))
;;      (:when (featurep! :ui workspaces)
;;      (:prefix-map ("TAB" . "workspace")))
;;      (:prefix-map ("b" . "buffer"))
;;      (:prefix-map ("c" . "code"))
;;      (:prefix-map ("f" . "file"))
;;      (:prefix-map ("g" . "git"))
;;      (:prefix-map ("i" . "insert"))
;;      (:prefix-map ("n" . "notes"))
;;      (:prefix-map ("o" . "open")
;;      (:prefix-map ("p" . "project"))
;;      (:prefix-map ("q" . "session"))
;;      (:when (featurep! :editor upload)
;;        (:prefix-map ("r" . "remote")))
;;      (:when (featurep! :editor snipets)
;;        (:prefix-map ("s" . "snippets")))
;;      (:prefix-map ("t" . "toggle")
;;        :desc "Toggle imenu-list" "m" #'imenu-list-smart-toggle)))

(setq dired-dwim-target t)

(use-package! tide
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))
