#!/bin/bash

############################################################
#
# Finds the differences between two files. 
#
# To run, ./fileCompare.sh file1.txt file2.txt
#
#
############################################################

# deletes the old file
if [ -f "differences.txt" ]; then
  rm differences.txt
fi

echo "What is the name of the first file? (include file extension)"
read file1
echo "What is the name of the second file? (include file extension)"
read file2

# finds the differences in one file, compare it to one
for line in `cat ${file1}`
do
  if ! (egrep -q $line ${file2}); then
	echo $line >> differences.txt
  fi
done

# compare in the other file
for line in `cat ${file2}`
do
  if ! (egrep -q $line ${file1}); then
	echo $line >> differences.txt
  fi
done

cat differences.txt | sort -u >> differences2.txt

cat differences2.txt > differences.txt

rm differences2.txt
