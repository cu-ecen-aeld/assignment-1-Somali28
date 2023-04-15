
# filesdir=$1
# archstr=$2
# providedargs=$#
# inputarg=2
# if [ providedargs != inputarg ]
# then
#     echo "ERROR : Invalid Number of Arguments
#         Total Number of Arguments should be 2
#         The order of the arguments should be:
# 	       1')' Path to a directory on the filesystem.
# 	       2')' String to be searched within the specified filesystem."
#     exit 1
# fi

# if [ -d "$filesdir" ]
# then
#     echo "$archstr"
#     echo "$filesdir"
#     X=$(grep -l "$archstr" "$filesdir"/* | wc -l)
#     Y=$(grep -c "$archstr" "$filesdir"/* | awk -F: '{s+=$2} END {print s}')
#     echo "The number of files are $X and the number of matching lines are $Y"
#     exit 0
# else
#     echo "$filesdir doesnot exists on your filesystem."
#     exit 1
# fi



#!/bin/bash

filesdir=$1
searchstr=$2

#echo Path is $filesdir
#echo Search string is $searchstr

#echo

# Check if 2 arguments are passed
if [ $# -lt 2 ] 
then
	echo "Failed"
	echo "Total number of arguments should be 2"
	echo "Order of arguments should be -"
	echo "	1) Path of Directory"
	echo "	2) String to be searched"
	exit 1
fi

# Check if path provided is a directory
if [ -d $filesdir ]
then
	echo "$filesdir is a directory"
else
	echo "$filesdir is not a directory"
	exit 1
fi

X=$( ls $filesdir | wc -l )
#grep -rnw $filesdir -e $searchstr
Y=$( grep -roh $searchstr $filesdir | wc -w)
echo The number of files are $X and the number of matching lines are $Y