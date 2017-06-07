#!/bin/bash

echo "Plugins are updating:"
cd plugins
for dir in $(ls); do
	echo -e "Updating \033[34m$dir\033[0m:"
	cd $dir && git pull && cd ..
	echo ""
done
cd ..

