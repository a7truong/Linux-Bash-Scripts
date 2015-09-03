#!/bin/bash
##########################################################
# 
# Accepts two files as parameters, call like:
# ./fileSimilar.sh file1.txt file2.txt
#
# Checks for similar text between two files and outputs the
# result into a new text file called similar.txt
#
##########################################################

# deletes the old file
if [ -f "similar.txt" ]; then
  rm similar.txt
fi

echo "What is the name of the first file? (include the extension)?"
read file1
echo "What is the name of the second file? (include the extension)?"
read file2

# finds the differences in one file, compare it to one
for line in `cat ${file1}`
do 
  if egrep $line ${file2}; then
	echo $line >> similar.txt
  fi
done

for line in `cat ${file2}`
do
  if egrep $line ${file1}; then
	echo $line >> similar.txt
  fi
done

cat similar.txt | sort -u >> similar2.txt

cat similar2.txt > similar.txt

rm similar2.txt
