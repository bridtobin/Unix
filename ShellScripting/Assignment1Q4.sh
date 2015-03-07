/* Write a script that takes as input one argument - a directory path. It then recursively lists the directory structure below the given path as in this example:
*
*  /path/to/dir
*  |-- subdir1
*  | |-- file1
*  | |-- file2
*  |-- subdir2
*    |-- file3
*    |-- subdir3
*      |-- file4
*
*  The script does not need to list hidden files. Files and directories should be sorted by name.
*  
*  You should implement a recursive function with local variables and pass indentation as an argument.
*/
#!/bin/bash
function listdirectory()
{
   
   level=$2
   lastDirectory=$3
   for item in $1/*; do
       if [  "$item" = "$lastDirectory" ] ; then
          atLastDirectory="yes"
       fi

       for ((indents=0; indents <$2 ; indents++)); do
           if [ "$atLastDirectory" = "yes" ]; then 
                  printf "  "
           else
                  printf "| "
           fi
       done

        printf "|-- $(basename "$item")\n"
        if [ -d "$item" ]; then           
           countFilesInDir=$(ls $item | wc -l)
           if [ $countFilesInDir != 0 ]; then
              listdirectory $item $((level+1)) $lastDirectory 
              level=$((level-1))
           fi
        fi
    done
}

if [ $# -ne 1 ]; then
  echo "usage: $0 <Please add path as argument>" 1>&2
  exit 1
fi
echo $1
var1=$(ls $1/* -d | tail -1)
listdirectory $1 0 $var1
