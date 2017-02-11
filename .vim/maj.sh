#!/bin/bash

echo "MaJ plugins :"
cd bundle
for dir in $(ls); do
	echo -e "\033[34m$dir\033[0m"
	cd $dir && git pull && cd ..
	echo ""
done
cd ..

echo -e "\033[31mMaJ pathogen :\033[0m"
cd pathogen && git pull && cd ..

echo -e "\n\nMaJ terminée !"
