#!/bin/bash

echo "Plugins are updating:"
cd bundle
for dir in $(ls); do
	echo -e "Updating \033[34m$dir\033[0m:"
	cd $dir && git pull && cd ..
	echo ""
done
cd ..

echo -e "Updating \033[31mpathogen\033[0m:"
curl -LSso ~/.config/nvim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo -e "\n\nAll your plugins are now up-to-date."
