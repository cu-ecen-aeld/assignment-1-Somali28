#!/bin/bash

writefile=$1
writestr=$2

#extracts only the directory 
CDIR=$( dirname "$writefile" )

if [ "$#" -ne "2" ]
then 
    echo "ERROR : Invalid Number of Arguments
    Total Number of Arguments should be 2
    The order of the arguments should be:
        1')' Full path to a file (including filename) on the filesystem.
        2')' Text string which will be written within this file."
    exit 1
fi

#tries to creates file directory
mkdir -p "$CDIR"
touch "$writefile"

echo Path is $writefile
echo String is $writestr

if [ -f $writefile ]
then
    echo "$2" > "$1"
else
    echo "File couldnot be created"
    exit 1
fi

