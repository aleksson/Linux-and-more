#!/bin/sh

ENV_PROD=$(TERM=ansi whiptail --yesno "Environment : Production" 8 78 Blue --title "SkyScan v0.1" 3>&1 1>&2 2>&3)
STRING_TO_FIND=$(TERM=ansi whiptail --inputbox "String to Search for..." 8 78 3>&1 1>&2 2>&3)

#GREP_TESTFILE=$(grep -c $STRING_TO_FIND ./SERVER/TEST/file.txt);
#echo "Found the string '$STRING_TO_FIND' : $GREP_TESTFILE times in file.txt"



exitstatus=$?
if [ $exitstatus = 0 ]; then
	$(TERM=ansi whiptail --msgbox "Environment : Production" 8 78 Blue 3>&1 1>&2 2>&3)
	GREP_TESTFILE=$(grep -c $STRING_TO_FIND ./SERVER/PROD/file.txt);
	$(TERM=ansi whiptail --msgbox "$STRING_TO_FIND found : $GREP_TESTFILE times" 8 78 Blue 3>&1 1>&2 2>&3)
	
	echo "Use 'Production' as Environment"
else
	$(TERM=ansi whiptail --msgbox "Environment : Test" 8 78 Blue 3>&1 1>&2 2>&3)
	GREP_TESTFILE=$(grep -c $STRING_TO_FIND ./SERVER/TEST/file.txt);
	$(TERM=ansi whiptail --msgbox "$STRING_TO_FIND found : $GREP_TESTFILE times" 8 78 Blue 3>&1 1>&2 2>&3)
	echo "Use 'Test' as Environment"
fi

echo "(Exit status was $exitstatus)"