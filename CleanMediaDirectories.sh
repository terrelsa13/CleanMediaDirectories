#!/bin/bash

### OK To Edit These Variables ###
MediaPaths=("/media/Pharaoh/xbmc/TV/"*"/Season."*
            "/media/Pharaoh/xbmc/TV/"*
            "/media/Pharaoh/xbmc/Movies/"*)
MinDirSizeRaw=69 #MB
##################################

### Do NOT Edit Anything Below This Line ###
ByteBase=1024 #KB = 1MB
MinDirSize=$(( ${MinDirSizeRaw} * ${ByteBase} ))
Index=0
###################################

echo
echo "-----------------------------------------------------------"
#echo "$MinDirSize"
echo "Cleaning Up Directories Less Than ${MinDirSizeRaw}MB:"
echo "-----------------------------------------------------------"

#Start the cleanup
for vidpaths in "${MediaPaths[@]}"
do

   #du -s $vidpaths | while read size dirname
   while read size dirname
   do
      if [ $size -le $MinDirSize ]
      then
         echo "Deleting: $dirname"
         rm -rf "$dirname"
         DeletedElements[${Index}]="$dirname"
         (( Index++ ))
      else
         echo "Keeping: $dirname"
         sleep 0
      fi
   done < <(du -s $vidpaths)
done

echo
echo "-----------------------------------------------------------"
echo "Summary Of Deleted Directories:"
echo "-----------------------------------------------------------"

if [ ${Index} -gt 0 ]
then
   for loops in `seq 0 $(( Index - 1 ))`
   do
      echo "[DELETED] ${DeletedElements[$loops]}"
   done
else
   echo "None"
fi

echo
echo "-----------------------------------------------------------"
echo "Done."
echo "-----------------------------------------------------------"
echo
