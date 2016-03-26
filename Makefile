DOTFILES := $(shell pwd)
all: shell _vim

shell:
	ln -fs $(DOTFILES)/bash_profile ${HOME}/.bash_profile
	ln -fs ${DOTFILES}/aliases ${HOME}/.aliases

_vim:
	ln -fs $(DOTFILES)/vimrc ${HOME}/.vimrc

_git:
	ln -fs $(DOTFILES)/gitconfig ${HOME}/.gitconfig
	ln -fs $(DOTFILES)/gitignore ${HOME}/.gitignore
