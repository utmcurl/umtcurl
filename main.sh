#! /bin/sh

#Set some variables which represents the directory which contains the files of the tests and the location of the binary of the executable
#Simply add /* to get all the files inside the directory, works with /home/test and /home/test/ but not with /home/test/*
DIRECTORY=$1
EXECUTABLEPATH=$2
EXECUTABLERUNNING=0 #0 for not running; 1 for running
##
#
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
##
#
executableRunning ()
{
#Get the executable name by removing everything till the last /
EXECUTABLENAME=`basename $EXECUTABLEPATH`
#Get the PID of the executable
PIDOFEXECUTABLE=`pidof $EXECUTABLENAME`

if [ "$PIDOFEXECUTABLE" != "" ]
	then
	EXECUTABLERUNNING=1
else
	EXECUTABLERUNNING=0
fi
}
##
#
killExecutable ()
{
#Kill
if [ $EXECUTABLERUNNING == 1 ] #Running
	then 
	`kill -9 $PIDOFEXECUTABLE`
	EXECUTABLERUNNING=0
fi

}
##
#
startExecutable ()
{
#Start
if [ $EXECUTABLERUNNING == 0 ] #Not running
	then 
	#Start it! The ( ) makes sure it's a fork and the & makes sure input can be given
	exec $EXECUTABLEPATH ; sleep 1 &
	EXECUTABLERUNNING=1
fi

}
###			###
# END OF FUNCTIONS	  #
###			###
if [ "$DIRECTORY" != "" ] && [ "$EXECUTABLEPATH" != "" ] 
then

	#Show the set variables
	echo "--------"
	echo "Directory: $DIRECTORY"
	echo "Executable: $EXECUTABLEPATH"
	echo "--------"

	
	#Make sure the given executable isn't already running	
	#Set the variable
	executableRunning
	if [ $EXECUTABLERUNNING == 1 ]
	then
		killExecutable
	fi

	#For every file in the given directory
	for FILE in $DIRECTORY/*
	do
		#Set a variable which  represents the extension of the file
		EXT=${FILE##*.}
		#A test will only be executed if the extension is .active
		if [ "$EXT" == "active" ]
		then
			.  $FILE
		fi

	done
else
	usageProvider
fi



