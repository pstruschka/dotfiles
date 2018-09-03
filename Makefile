all: emacs git i3wm vim x zsh

clean: uninstall_emacs uninstall_git \
       uninstall_i3wm uninstall_vim \
       uninstall_x uninstall_zsh

.PHONY: emacs git i3wm vim x zsh

emacs:
	stow -t ~ emacs
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

uninstall_emacs:
	stow -Dt ~ emacs
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
