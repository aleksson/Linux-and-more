#!/bin/sh

#only print out found
#grep word ./SERVER/file.txt | cat

#print out after found
grep word ./SERVER/file.txt > output.txt


cat output.txt

#rm output.txt
