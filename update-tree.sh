#!/bin/bash

TMFROOT=~/Library/texmf

if [ -d $(dirname $TMFROOT) ] ; then
    mkdir -p $TMFROOT/tex/latex
fi

for d in *; do
    if ! [ -d "$d" ] ; then continue ; fi
    ln -svf $PWD/$d $TMFROOT/tex/latex
done

for d in *.def; do
    ln -svf $PWD/$d $TMFROOT/tex/latex
done

texhash $TMFROOT
