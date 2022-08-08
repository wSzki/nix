#!/bin/sh

mkdir -p ~/.tmp
cd ~/.tmp

EXT=~/.local/share/SuperCollider/Extensions

nix-shell -p cabal-install --run "cabal update && cabal new-install tidal --lib"
#cabal update
#cabal new-install tidal --lib

sclang ./quarkinstall.sc

wget https://github.com/v7b1/mi-UGens/releases/download/v0.0.3/mi-UGens-Linux.zip
unzip mi-UGens-Linux.zip
mv ./mi-UGens/ $EXT/

#git clone --recursive https://github.com/supercollider/supercollider.git
#git clone --recursive https://github.com/supercollider/sc3-plugins.git
#cd sc3-plugins
#mkdir build
#cd build

#PREPARE_BUILD="cmake -DSC_PATH=../../supercollider -DCMAKE_BUILD_TYPE=Release -DSUPERNOVA=ON .."
#BUILD="cmake --build . --config Release"
#nix-shell -p cmake fftw fftwFloat --run $PREPARE_BUILD
#nix-shell -p cmake fftw fftwFloat --run $BUILD


