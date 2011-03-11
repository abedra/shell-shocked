function backup {
    local FILE=$1
    if [ -L $FILE ]; then
        rm $FILE
    elif [ -e $FILE ]; then
        mv $FILE $FILE.bak
    fi
}

function link_with_backup {
    local FILENAME=$1
    local SOURCE=$DOTFILES/$FILENAME
    local TARGET=$HOME/$FILENAME
    backup $TARGET
    ln -sf $SOURCE $TARGET
}

function install_elpa {
    rm -rf $DOTFILES/.emacs.d/elpa
    emacs --script $DOTFILES/install_elpa.el
}

function install_org_mode {
    git clone git://orgmode.org/org-mode.git ~/.emacs.d/org-mode
    pushd ~/.emacs.d/org-mode
    make
    popd
}
