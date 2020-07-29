special_files := git nvim tmux zsh
simple_files := emacs spacemacs doom-emacs vim fish
pkg_dependent_files := basics i3wm bspwm herbstluftwm xmonad x polybar
all_files := $(special_files) $(simple_files) $(pkg_dependent_files)


.PHONY: $(all_files)

MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
BASE_DIR := $(patsubst %/,%,$(dir $(MAKEFILE_PATH)))


$(simple_files):
	stow -t ~ $@

$(pkg_dependent_files): yay
	yay -Q - < meta/$@_deps || yay -S --needed - < meta/$@_deps
	stow -t ~ $@

# special install rules
git:
	pacman -Q git || sudo pacman -S git
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

zsh: basics antibody
	stow -t ~ $@

antibody: $(BASE_DIR)/zsh/.config/zsh/zsh_plugins.txt
	curl -sfL git.io/antibody | sh -s - -b $(BASE_DIR)/zsh/.local/bin
	$(BASE_DIR)/zsh/.local/bin/antibody bundle < $(BASE_DIR)/zsh/.config/zsh/zsh_plugins.txt > $(BASE_DIR)/zsh/.config/zsh/zsh_plugins.sh


$(addprefix uninstall_,$(all_files)):
	stow -Dt ~ $(subst uninstall_,,$@)

uninstall_%:
	stow -Dt ~ $*
