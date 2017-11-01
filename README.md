# myvimconfig
`Vim` plugins and configuration files for smooth `C/C++` and `Python` development.

# Installation
* Pull latest version of `Vundle`: `git submodule update --init --recursive`
* Symlink `.vimrc`: `ln -s ~/.vim/.vimrc ~/.vimrc`
* Pull the plugins: `vim +PluginInstall +qall`
* Additional plugins installation:
  * `YouCompleteMe`: buid `./bundle/YouCompleteMe/install.py --clang-completer`
  * `Tagbar`: run `sudo apt-get install exuberant-ctags`
  * `Airline`: install the patched [`powerline-fonts`](https://github.com/powerline/fonts) by running `./install_powerline.sh`
