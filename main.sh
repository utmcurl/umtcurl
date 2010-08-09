#! /bin/sh


#Checks if there is a given argument that represents the directory which contains the scripts
#Set a variable which represents the directory which contains the files of the tests
#This is more an extra, it doesn't support all cases and basicly you only want to use the current directory
if [ "$1" = "" ] #Empty?
then
	FILES=$PWD/* #Use the current directory -not all supporting
	EXECUTABLEPATH=
else
	FILES=$1/* #Use the given directory -use on own "risk"
	
	if [ "$1" == "--help" || "$1" == "-h" || "$1" == "-?" ] #Print some usage info
	EXECUTABLEPATH=

fi


if [ "$1" == "--help" || "$1" == "-h" || "$1" == "-?" ] #Print some usage info

for f in $FILES
do
  echo "Processing $f file..."
done

