.PHONY: check dotfiles config

all: dotfiles config check

check:
	@! grep -rnw '.assword\|secret' --exclude='Makefile' .

dotfiles:
	ln -sf $(PWD)/.gitconfig $(HOME)
	ln -sf $(PWD)/.gtkrc-2.0 $(HOME)
	ln -sf $(PWD)/.xbindkeysrc $(HOME)
	ln -sf $(PWD)/.xinitrc $(HOME)
	ln -sf $(PWD)/.yaourtrc $(HOME)
	ln -sf $(PWD)/.zshrc $(HOME)
	
config:
	ln -sf $(PWD)/i3/config $(HOME)/.config/i3
	ln -sf $(PWD)/i3status/config $(HOME)/.config/i3status
	ln -sf $(PWD)/termite/config $(HOME)/.config/termite
	ln -sf $(PWD)/nvim/init.vim $(HOME)/.config/nvim
	ln -sf $(PWD)/vifm/vifmrc $(HOME)/.config/vifm/vifmrc
	ln -sf $(PWD)/vifm/Molokai.vifm $(HOME)/.config/vifm/colors
	ln -sf $(PWD)/inkscape/preferences.xml $(HOME)/.config/inkscape
