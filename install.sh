#!/bin/sh

echo

echo "1. Nyarch"
echo "2. Minimal"
echo "3. Windows 11"
echo "4. Tux"
echo
echo -en "Choose the config you wanna install (1/2/3/4/5...) "
read A
[ "$A" = "" ] && A=1

echo
echo -en "Do you want to use this as the default config? (y/n) "
read B
[ "$B" = "Y" ] || [ "$B" = "" ] && B="y"

if [ "$B" = "y" ]; then
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
        cfg="Nyarch"
        A="nyarch.jsonc"
        img="nyarch.png"
        ;;

    2)
        cfg="Minimal"
        A="minimal.jsonc"
        ;;

    3)
        cfg="Windows 11"
        A="windows11.jsonc"
        ;;

    4)
        cfg="Tux"
        A="tux.jsonc"
        ;;

    *)
        echo "Invalid config choice, quitting"
        exit
        ;;
esac

echo "Copying $cfg config"
cp configs/$A ~/.config/fastfetch/$A
[ -e "~/.config/fastfetch/config.jsonc" ] && \
    [ $C = "y" ] && mv ~/.config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc.old

[ "$B" = "y" ] && mv ~/.config/fastfetch/$A ~/.config/fastfetch/config.jsonc

[ "$D" = "y" ] && \
    echo "Copying image" && \
    cp images/$img ~/.config/fastfetch/$img && \
    echo "If you wanna see the image, ensure you have imagemagick and use kitty or any other kitty-based terminal (e.g. Konsole)"

echo "Done!"