#!/bin/bash

WCSim=$HYPERKDIR/WCSim
export LD_LIBRARY_PATH=$WCSim:$LD_LIBRARY_PATH

g++ $ValidationPath/Generate/daq_readfilemain.C -o $ValidationPath/Generate/daq_readfilemain `root-config --libs --cflags` -L $WCSim -lWCSimRoot -I $WCSim/include

i=0

for file in `ls $ValidationPath/Generate/macReference/*.mac`
do

i=$(expr $i + 1)

if [ $i -eq $1 ]
then
$WCSim/exe/bin/Linux-g++/WCSim $file
$ValidationPath/Generate/daq_readfilemain *.root
fi

done