#!/bin/bash

##################################################################
#
# Takes a file name as an argument (along with file extension).
# For example, to run ./SearchReplace.sh fileName.txt
#
# Then it will prompt you to replace a certain word within the
# fileName.txt file. It will make a copy of the file with the 
# replaced word and name it fileName_replaced.txt.
#
##################################################################

echo "-----------------------------------------------"
echo "               Search and Replace              "
echo "-----------------------------------------------"

echo "What is the text file you want to do a search and replace? (include file extension)" 
read filename
fname="${filename}"
echo ""
newName="replaced_${fname}" 
if [ -f ${fname} ]; then
  touch "${newName}"
  file=`less $fname`
  echo "1. What word would you like to replace?"
  read word
  echo ""
  echo "2. Replace \"${word}\" with what word?"
  read replace
  echo ""
    
  for i in ${file}; do
    if [ ${i} = ${word} ]; then 
      echo "${reaplce}" >> ${newName}
    else 
      echo "${i}" >> ${newName} 
    fi  
  done
else
  echo "${fname} does not exists"
fi  



