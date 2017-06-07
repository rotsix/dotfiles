#!/bin/bash

# pathogen
echo -e "Installing pathogen:"
mkdir -p ~/.config/nvim/autoload ~/.config/nvim/bundle && \
curl -LSso ~/.config/nvim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo -e "Done.\n"

#colorizer
rm -rf ~/.config/nvim/bundle/colorizer 2> /dev/null
echo -e "Installing Colorizer:"
git clone https://github.com/lilydjwg/colorizer ~/.config/nvim/bundle/colorizer
echo -e "Done.\n"

#lightline.vim
rm -rf ~/.config/nvim/bundle/lightline.vim 2> /dev/null
echo -e "Installing lightline.vim:"
git clone https://github.com/itchyny/lightline.vim ~/.config/nvim/bundle/lightline.vim
echo -e "Done.\n"

#supertab
rm -rf ~/.config/nvim/bundle/supertab 2> /dev/null
echo -e "Installing supertab:"
git clone https://github.com/ervandew/supertab.git ~/.config/nvim/bundle/supertab
echo -e "Done.\n"

#vim-nerdtree-tabs
rm -rf ~/.config/nvim/bundle/vim-nerdtree-tabs 2> /dev/null
echo -e "Installing vim-nerdtree-tabs:"
git clone https://github.com/jistr/vim-nerdtree-tabs.git ~/.config/nvim/bundle/vim-nerdtree-tabs
echo -e "Done.\n"

#delimitMate
rm -rf ~/.config/nvim/bundle/delimitMate 2> /dev/null
echo -e "Installing delimitMate:"
git clone https://github.com/Raimondi/delimitMate.git ~/.config/nvim/bundle/delimitMate
echo -e "Done.\n"

#nerdtree
rm -rf ~/.config/nvim/bundle/nerdtree 2> /dev/null
echo -e "Installing NERDTree:"
git clone https://github.com/scrooloose/nerdtree.git ~/.config/nvim/bundle/nerdtree
echo -e "Done.\n"

#tabular
rm -rf ~/.config/nvim/bundle/tabular 2> /dev/null
echo -e "Installing tabular:"
git clone git://github.com/godlygeek/tabular.git ~/.config/nvim/bundle/tabular
echo -e "Done.\n"

#vim-sensible
rm -rf ~/.config/nvim/bundle/vim-sensible 2> /dev/null
echo -e "Installing vim-sensible:"
git clone git://github.com/tpope/vim-sensible.git ~/.config/nvim/bundle/vim-sensible
echo -e "Done.\n"

