#!/bin/bash

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