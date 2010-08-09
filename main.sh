#! /bin/sh

usageProvider ()
{
if [ "$1" == "--help" ] || [ "$1" == "-h" ] || [ "$1" == "" ] || [ "$1" == " " ] #Print some usage info
then
	echo "Usage: sh main.sh [directory of test scripts] [executable path of proxy]"
	echo "      [sh main.sh /home/surfrightbv/testfiles /home/sufrightbv/program/proxy]"
	echo ""
	echo "Commands:"
	echo "	--help | -h | -? | - This help"
fi

}




if [ "$1" != "" ] && [ "$2" != "" ] 
then
#Set some variables which represents the directory which contains the files of the tests and the location of the binary of the executable
#Simply add /* to get all the files inside the directory, works with /home/test and /home/test/ but not with /home/test/*
	DIRECTORY=$1/*
	EXECUTABLEPATH=$2
	
	echo "Directory: $DIRECTORY"
	echo "Executable: $EXECUTABLEPATH"

	for f in $DIRECTORY
	do
		echo $f
	done
else
	usageProvider
fi



