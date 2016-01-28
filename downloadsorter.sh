#!/bin/bash

if [ -d "$HOME/Downloads" ]
then
    mv -n $HOME/Downloads/{*.png,*.jpg,*.tiff,*.bmp,*.jpeg,*.JPG,*.gif} $HOME/Pictures/
    echo 'Pictures moved...'
    mv -n $HOME/Downloads/{*.avi,*.webm,*.mkv,*.mp4} $HOME/Videos/
    echo 'Videos moved...'
    mv -n $HOME/Downloads/{*.doc,*.docx,*.pdf,*.odt} $HOME/Documents/
    echo 'Documents moved...'
    echo 'Files remaining in downloads:'
    ls -Fc $HOME/Downloads
fi

if [ -d "$HOME/Lataukset" ]
then
    mv -n $HOME/Lataukset/{*.png,*.jpg,*.tiff,*.bmp,*.jpeg,*.JPG,*.gif} $HOME/Kuvat/
    echo 'Kuvat siirretty...'
    mv -n $HOME/Lataukset/{*.avi,*.webm,*.mkv,*.mp4} $HOME/Videot/
    echo 'Videot siirretty...'
    mv -n $HOME/Lataukset/{*.doc,*.docx,*.pdf,*.odt} $HOME/Asiakirjat/
    echo 'Asiakirjat siirretty...'
    echo 'Tiedostoja latauskansiossa:'
    ls -Fc $HOME/Lataukset
fi

