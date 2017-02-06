xrdb -merge ~/.Xresources
xinput set-button-map 10 3 2 1 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
export DefaultIMModule=fcitx
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
exec openbox-session
