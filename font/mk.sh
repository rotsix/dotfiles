#!/bin/bash

dir="$(dirname $0)"
echo "creating env"
rm -rf $dir/env 
virtualenv2 $dir/env 
source $dir/env/bin/activate  
pip install fontTools 
echo "customizing font"
rm -rf $dir/Output_Fonts 
mkdir $dir/Output_Fonts 
mkdir ~/.local/share/fonts 
shopt -s globstar
python $dir/Scripts/inputCustomize.py $dir/Input_Fonts/**/*.ttf --dest=$dir/Output_Fonts --a --g --asterisk 
echo "generating cache"
cp $dir/Output_Fonts/**/*.ttf ~/.local/share/fonts 
fc-cache -fv 
echo "done"
deactivate 
rm -rf $dir/env 
