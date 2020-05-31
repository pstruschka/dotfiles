all_files := basics emacs spacemacs doom-emacs git i3wm bspwm vim nvim tmux x zsh fish
simple_files := emacs spacemacs doom-emacs vim fish


.PHONY: $(all_files) zplug


$(simple_files):
	stow -t ~ $@

# special install rules
basics: yay
	yay -Q - < meta/basic_deps || yay -S --needed - < meta/basic_deps
	stow -t ~ $@

x: yay
	pacman -Q - < meta/x_deps || yay -S --needed - < meta/x_deps
	stow -t ~ $@

git:
	pacman -Q git || sudo pacman -S git
	stow -t ~ $@

i3wm: yay
	pacman -Q - < meta/i3wm_deps || yay -S --needed - < meta/i3wm_deps
	stow -t ~ $@

bspwm: yay
	pacman -Q - < meta/bspwm_deps || yay -S --needed - < meta/bspwm_deps
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

zsh: basics zplug
	stow -t ~ $@

zplug:
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh



$(addprefix uninstall_,$(all_files)):
	stow -Dt ~ $(subst uninstall_,,$@)

uninstall_%:
	stow -Dt ~ $*
