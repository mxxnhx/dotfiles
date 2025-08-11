# install required packages
sudo apt install git vim tmux zsh curl -y

# configure vim
cp ./vimrc ~/.vimrc

# configure zsh with ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
cp ./zshrc ~/.zshrc

# configure tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp ./tmux.conf ~/.tmux.conf
~/.tmux/plugins/tpm/scripts/install_plugins.sh
