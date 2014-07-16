#!/bin/bash

TMFROOT=~/Library/texmf

if [ -d $(dirname $TMFROOT) ] ; then
    mkdir -p $TMFROOT/tex/latex
fi

ln -svf ~/Dropbox/LaTeX/mczchem $TMFROOT/tex/latex

texhash $TMFROOT
