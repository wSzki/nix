#!/bin/sh

EXT=~/.local/share/SuperCollider/Extensions

wget https://github.com/v7b1/mi-UGens/releases/download/v0.0.3/mi-UGens-Linux.zip
unzip mi-UGens-Linux.zip
mv ./mi-UGens/ $EXT/
rm -rf ./mi-UGens-Linux.zip

cabal update
cabal new-install tidal --lib

sclang ./quarkinstall.sc
