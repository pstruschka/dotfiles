all: emacs git i3wm vim x zsh basics

clean: uninstall_emacs uninstall_spacemacs \
       uninstall_git uninstall_i3wm \
       uninstall_vim uninstall_x uninstall_zsh \
       uninstall_basics

.PHONY: emacs spacemacs git i3wm vim x zsh basics

emacs:
	stow -t ~ emacs
spacemacs:
	stow -t ~ spacemacs
git:
	stow -t ~ git
i3wm:
	stow -t ~ i3wm
vim:
	stow -t ~ vim
x:
	stow -t ~ x
zsh:
	stow -t ~ zsh
basics:
	stow -t ~ basics

uninstall_emacs:
	stow -Dt ~ emacs
uninstall_spacemacs:
	stow -Dt ~ spacemacs
uninstall_git:
	stow -Dt ~ git
uninstall_i3wm:
	stow -Dt ~ i3wm
uninstall_vim:
	stow -Dt ~ vim
uninstall_x:
	stow -Dt ~ x
uninstall_zsh:
	stow -Dt ~ zsh
uninstall_basics:
	stow -Dt ~ basics
