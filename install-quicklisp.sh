#!/bin/sh
echo 'Downloading latest Quicklisp...'
curl -O https://beta.quicklisp.org/quicklisp.lisp
#echo 'Verifying Quicklisp signature...' #FIXME signature checking
#curl -O https://beta.quicklisp.org/quicklisp.lisp.asc
#gpg --verify quicklisp.lisp.asc quicklisp.lisp
echo -e '\nStarting Quicklisp installation...'
sbcl --load "quicklisp.lisp" #FIXME determine which implementations exists
echo -e '\nAll done!'
echo 'Remove downloaded files? [y/N]: '
read -n1 r
if [ "$r" == "y" ]; then
    echo && rm -v quicklisp.lisp
fi
