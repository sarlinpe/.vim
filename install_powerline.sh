cwd=$(pwd)
dir=~/tmp_powerline

git clone https://github.com/powerline/fonts.git $dir --depth=1
cd $dir && ./install.sh
cd $cwd && rm -rf $dir
