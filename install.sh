#!/bin/sh

echo

echo "1. Nyarch"
echo "2. Minimal"
echo "3. Windows 11"
echo
echo -en "Choose the config you wanna install (1/2/3/4/5...) "
read A
[ "$A" = "" ] && A=1

echo
echo -en "Do you want to use this as the default config? (y/n) "
read B
[ "$B" = "Y" ] || [ "$B" = "" ] && B="y"

if [ "$B" = "y" ]; then
    echo
    echo -en "Do you want to keep the old config? (y/n) "
    read C
fi

echo
if [ $A -eq 1 ]; then
    echo -en "Do you want to copy the image necessary for the config? (y/n) "
    read D
    [ "$D" = "Y" ] || [ "$D" = "" ] && D="y" 
fi

[ -d "~/.config/fastfetch" ] && mkdir "~/.config/fastfetch"

case $A in
    1)  
        echo "Copying Nyarch config"
        cp configs/nyarch.jsonc ~/.config/fastfetch/nyarch.jsonc
        if [ -e "~/.config/fastfetch/config.jsonc" ]; then
            [ "$C" = "y" ] && cp ~/.config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc.old
        fi
        [ "$B" = "y" ] && mv ~/.config/fastfetch/nyarch.jsonc ~/.config/fastfetch/config.jsonc

        [ "$D" = "y" ] && \ 
            echo "Copying image" && \
            cp ./images/nyarch.png ~/.config/fastfetch/nyarch.png
        
        echo "If you wanna see the image, ensure you have imagemagick and use kitty or any other kitty-based terminal (e.g. Konsole)"
        ;;

    2)
        echo "Copying Minimal config"
        cp configs/minimal.jsonc ~/.config/fastfetch/minimal.jsonc
        if [ -e "~/.config/fastfetch/config.jsonc" ]; then
            [ $C = "y" ] && cp ~/.config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc.old
        fi
        [ $B = "y" ] && mv ~/.config/fastfetch/minimal.jsonc ~/.config/fastfetch/config.jsonc
        ;;

    3)
        echo "Copying Windows 11 config"
        cp configs/windows11.jsonc ~/.config/fastfetch/windows11.jsonc
        if [ -e "~/.config/fastfetch/config.jsonc" ]; then
            [ $C = "y" ] && cp ~/.config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc.old
        fi
        [ $B = "y" ] && mv ~/.config/fastfetch/windows11.jsonc ~/.config/fastfetch/config.jsonc
        ;;

    *)
        echo "Invalid config choice, quitting"
        exit
        ;;
esac

echo "Done!"