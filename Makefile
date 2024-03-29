DOTFILES := $(shell pwd)
all: shell vim git
.PHONY: bash zsh vim git

bash:
	ln -fs $(DOTFILES)/bash_profile ${HOME}/.bash_profile
	ln -fs $(DOTFILES)/bashrc ${HOME}/.bashrc
	ln -fs ${DOTFILES}/aliases ${HOME}/.aliases

zsh:
	sh ${DOTFILES}/zsh/oh_my_zsh ${DOTFILES}
	ln -fs ${DOTFILES}/zsh/zshrc ${HOME}/.zshrc

vim:
	mkdir -p ${HOME}/.vim
	ln -fns $(DOTFILES)/vim/* ${HOME}/.vim
	ln -fs $(DOTFILES)/vim/vimrc ${HOME}/.vimrc
	ln -fs $(DOTFILES)/vim/vimrc.bundles ${HOME}/.vimrc.bundles
	ln -fs $(DOTFILES)/vim/gvimrc ${HOME}/.gvimrc

git:
	mkdir -p ~/.zsh
	echo "fpath=(~/.zsh $fpath)" >> ~/.zshrc
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh -o ~/.zsh/_git
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
	chmod +x ~/.git-completion.bash
	# tell zsh where git bash completion file is
	echo "zstyle ':completion:*:*:git:*' script ~/.git-completion.bash" >> ~/.zshrc
	ln -fs $(DOTFILES)/gitconfig ${HOME}/.gitconfig
	ln -fs $(DOTFILES)/gitignore ${HOME}/.gitignore
