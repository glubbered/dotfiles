ln -sfn ~/dotfiles/gemrc ~/.gemrc
ln -sfn ~/dotfiles/gitconfig ~/.gitconfig
ln -sfn ~/dotfiles/gitignore ~/.gitignore
ln -sfn ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sfn ~/dotfiles/vimrc ~/.vimrc
ln -sfn ~/dotfiles/vim ~/.vim
ln -sfn ~/dotfiles/ackrc ~/.ackrc

ln -sfn ~/dotfiles/zprezto ~/.zprezto
ln -sfn ~/dotfiles/zlogin ~/.zlogin
ln -sfn ~/dotfiles/zlogout ~/.zlogout
ln -sfn ~/dotfiles/zpreztorc ~/.zpreztorc
ln -sfn ~/dotfiles/zprofile ~/.zprofile
ln -sfn ~/dotfiles/zshenv ~/.zshenv
ln -sfn ~/dotfiles/zshrc ~/.zshrc

#ln -sfn ~/dotfiles/vimperator ~/.vimperator
#ln -sfn ~/dotfiles/vimperatorrc ~/.vimperatorrc
vim +BundleInstall! +qall
