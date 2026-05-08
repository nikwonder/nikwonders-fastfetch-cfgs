#!/bin/sh

echo "1. Nyarch"
echo "2. Minimal"
echo
echo -en "Choose the config you wanna install (1/2/3/4/5...) "
read A

echo
echo -en "Do you want to use this as the default config? (y/n) "
read B
[ $B == "Y" ] && B = "y"

if [ $B == "y" ]; then
    echo
    echo -en "Do you want to keep the old config? (y/n) "
    read C
fi

echo
[ $A -ne 2 ] && \
    echo -en "Do you want to copy the image necessary for the config? (y/n) " && \
    read d
    [ $D == "Y" ] && D = "y"

[ -d "~/.config/fastfetch" ] && mkdir "~/.config/fastfetch"

case $A in
    1)  
        echo "Copying nyarch config"
        cp "./configs/nyarch.jsonc" "~/.config/fastfetch/"
        if [ -e "~/.config/fastfetch/config.jsonc" ]; then
            [ $C == "y" ] && cp "~/.config/fastfetch/config.jsonc" "~/.config/fastfetch/config.jsonc.old"
        fi
        [ $B == "y" ] && mv "~/.config/fastfetch/nyarch.jsonc" "~/.config/fastfetch/config.jsonc"

        [ $D == "y" ] && \ 
            echo "Copying image" && \
            cp "./images/nyarch.png" "~/.config/fastfetch/"
        
        echo "If you wanna see the image, ensure you have imagemagick and use kitty or any other kitty-based terminal (e.g. Konsole)"
        ;;

    2)
        echo "Copying minimal config"
        cp "./configs/minimal.jsonc" "~/.config/fastfetch/"
        if [ -e "~/.config/fastfetch/config.jsonc" ]; then
            [ $C == "y" ] && cp "~/.config/fastfetch/config.jsonc" "~/.config/fastfetch/config.jsonc.old"
        fi
        [ $B == "y" ] && mv "~/.config/fastfetch/minimal.jsonc" "~/.config/fastfetch/config.jsonc"
        ;;

    *)
        echo "Invalid config choice, quitting"
        exit
        ;;
esac

echo "Done!"