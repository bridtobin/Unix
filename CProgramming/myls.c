/* Implement myls tool that prints out in a column the list of all entries in a directory. The directory name is specified by the input argument. 
*  If the argument is missing, take the current working directory. The entries should be taken from the directory only, excluding the entries 
*  from subdirectories (no recursion!). Do not sort the entries and do not print out dot (".") and dot-dot ("..") directories. What do these 
*  directories represent? myls should be invoked as follows:
*  $ ./myls
*  or
*  $ ./myls name
*  and return the following output:
*  directory1
*  file1
*  With -l option, myls should print two columns: column of letters f (file), d (directory), l (link), o (other) and column of names:
*  $ ./myls -l name
*  d directory1
*  f file1
*  On your laptop, you need to add #define _GNU_SOURCE in the first line of your code. You should use file system API to iterate over 
*  directory entries and getopt to handle -l option. The directory name argument should not be handled by getopt. You can access this 
*  argument after the getopt loop by using argv[optind] (please, see the last example in comp30570-L10). 
*  You should handle the case of missing directory name:
*  $ ./myls -l
*  In this case, you should use the current working directory and print out its entries in two columns. 
*  Hint: after the getopt loop, optind will be equal to argc.
*/