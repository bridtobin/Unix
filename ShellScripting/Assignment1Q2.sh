/* Write a script that creates a directory 'dir' and following empty files in it:
*  file1
*  File1
*  FILE2
*  FiLe3
*  The script should then rename the files to contain lower-case letters only. If a ﬁle name in lower-case letters already exists which would be 
*  overwritten by the renaming of the original file, the program should warn the user "file <filename> already exists", and should not rename 
*  the original file to overwrite the existing ﬁle. You should use a loop and the 'tr' utility.
*/
if [ -d dir ]; then
   echo "<dir already exists>"
   exit 1
else       
   mkdir dir
   cd dir
   touch file1
   touch File1   
   touch FILE2
   touch FiLe3
   for filename in *; do
      if [ $(echo $filename | tr '[:upper:]' '[:lower:]') != $filename ]; then
         if [ -f $(echo $filename | tr '[:upper:]' '[:lower:]') ]; then
            echo "file $(echo $filename | tr '[:upper:]' '[:lower:]') already exists"
         else
            mv $filename -i  $(echo $filename | tr '[:upper:]' '[:lower:]')
         fi
      fi
   done
   exit 0
fi

