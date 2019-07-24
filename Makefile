all: emacs git i3wm vim x zsh basics

clean: uninstall_emacs uninstall_spacemacs \
       uninstall_git uninstall_i3wm \
       uninstall_vim uninstall_x uninstall_zsh \
       uninstall_basics

.PHONY: emacs spacemacs git i3wm vim nvim tmux x zsh fish basics

basics: yay
	yay -Q - < meta/basic_deps || yay -S --needed - < meta/basic_deps
	stow -t ~ basics

emacs:
	stow -t ~ emacs
spacemacs:
	stow -t ~ spacemacs
git:
	pacman -Q git || sudo pacman -S git
	stow -t ~ git
i3wm: yay
	pacman -Q - < meta/i3wm_deps || yay -S --needed - < meta/i3wm_deps
	stow -t ~ i3wm
vim:
	stow -t ~ vim
x:
	stow -t ~ x
zsh:
	stow -t ~ zsh
fish:
	stow -t ~ fish

yay: git
	pacman -Q yay || (git clone aur:yay && pushd yay && makepkg -si && popd)

tmux: yay
	pacman -Q - < meta/powerline_deps || yay -S --needed - < meta/powerline_deps
	stow -t ~ tmux

nvim:
	curl -fLo nvim/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	stow -t ~ nvim

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
uninstall_fish:
	stow -Dt ~ fish
uninstall_basics:
	stow -Dt ~ basics
uninstall_tmux:
	stom -Dt ~ tmux
uninstall_nvim:
	stom -Dt ~ nvim
