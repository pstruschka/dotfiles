all_files := basics emacs spacemacs doom-emacs git i3wm vim nvim tmux x zsh fish
simple_files := emacs spacemacs doom-emacs vim x zsh fish


.PHONY: $(all_files)


$(simple_files):
	stow -t ~ $@

# special install rules
basics: yay
	yay -Q - < meta/basic_deps || yay -S --needed - < meta/basic_deps
	stow -t ~ $@
git:
	pacman -Q git || sudo pacman -S git
	stow -t ~ $@
i3wm: yay
	pacman -Q - < meta/i3wm_deps || yay -S --needed - < meta/i3wm_deps
	stow -t ~ $@
yay: git
	pacman -Q yay || (git clone aur:yay && pushd yay && makepkg -si && popd)

tmux: yay
	pacman -Q - < meta/powerline_deps || yay -S --needed - < meta/powerline_deps
	stow -t ~ $@

nvim:
	curl -fLo nvim/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	stow -t ~ $@




$(addprefix uninstall_,$(all_files)):
	stow -Dt ~ $(subst uninstall_,,$@)

uninstall_%:
	stow -Dt ~ $*
