#!/bin/bash

# pathogen
echo -e "Installing pathogen:"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo -e "Done.\n"

#colorizer
rm -rf ~/.vim/bundle/colorizer 2> /dev/null
echo -e "Installing Colorizer:"
git clone https://github.com/lilydjwg/colorizer ~/.vim/bundle/colorizer
echo -e "Done.\n"

#lightline.vim
rm -rf ~/.vim/bundle/lightline.vim 2> /dev/null
echo -e "Installing lightline.vim:"
git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim
echo -e "Done.\n"

#supertab
rm -rf ~/.vim/bundle/supertab 2> /dev/null
echo -e "Installing supertab:"
git clone https://github.com/ervandew/supertab.git ~/.vim/bundle/supertab
echo -e "Done.\n"

#vim-nerdtree-tabs
rm -rf ~/.vim/bundle/vim-nerdtree-tabs 2> /dev/null
echo -e "Installing vim-nerdtree-tabs:"
git clone https://github.com/jistr/vim-nerdtree-tabs.git ~/.vim/bundle/vim-nerdtree-tabs
echo -e "Done.\n"

#delimitMate
rm -rf ~/.vim/bundle/delimitMate 2> /dev/null
echo -e "Installing delimitMate:"
git clone https://github.com/Raimondi/delimitMate.git ~/.vim/bundle/delimitMate
echo -e "Done.\n"

#nerdtree
rm -rf ~/.vim/bundle/nerdtree 2> /dev/null
echo -e "Installing NERDTree:"
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
echo -e "Done.\n"

#tabular
rm -rf ~/.vim/bundle/tabular 2> /dev/null
echo -e "Installing tabular:"
git clone git://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular
echo -e "Done.\n"

#vim-sensible
rm -rf ~/.vim/bundle/vim-sensible 2> /dev/null
echo -e "Installing vim-sensible:"
git clone git://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible
echo -e "Done.\n"

