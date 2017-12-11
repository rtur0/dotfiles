#!/bin/sh

for file in dot.*; do
    name=${file/dot/}
    echo "Installing $name";
    ln -snFi `pwd`/$file ~/$name
done

echo "Installing vim bundles"
# vim +BundleInstall +qall

read -p "Do you want to install xorg related configurations? " -n 1 -ra
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    cd x
    ./install.sh
    cd -
fi
