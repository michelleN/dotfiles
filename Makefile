DOTFILES := $(shell pwd)
all: shell vim git
.PHONY: shell vim git

shell:
	ln -fs $(DOTFILES)/bash_profile ${HOME}/.bash_profile
	ln -fs $(DOTFILES)/bashrc ${HOME}/.bashrc
	ln -fs ${DOTFILES}/aliases ${HOME}/.aliases
	sh ${DOTFILES}/zsh/oh_my_zsh ${DOTFILES}
	ln -fs ${DOTFILES}/zsh/zshrc ${HOME}/.zshrc
	ln -fns $(DOTFILES)/etc/ ${HOME}/etc

vim:
	mkdir -p ${HOME}/.vim
	ln -fns $(DOTFILES)/vim/* ${HOME}/.vim
	ln -fs $(DOTFILES)/vim/vimrc ${HOME}/.vimrc
	ln -fs $(DOTFILES)/vim/vimrc.bundles ${HOME}/.vimrc.bundles
	ln -fs $(DOTFILES)/vim/gvimrc ${HOME}/.gvimrc

git:
	ln -fs $(DOTFILES)/gitconfig ${HOME}/.gitconfig
	ln -fs $(DOTFILES)/gitignore ${HOME}/.gitignore
