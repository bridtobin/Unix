/* Implement myps tool that invokes ps. myps should not handle any program arguments. ps should be invoked with -o option 
*  to print pid and command line of all processes run by the root user (-u option), in two columns. Please, check man ps 
*  about the custom-format output. The output of ps should be pipelined to C and printed with all lines numbered as follows:
*  $ ./myps
*  1: 1234 /path/to/program1 arguments
*  2: 4356 /path/to/program2 arguments
*  Some system processes do not have corresponding programs and may be in brackets and without arguments.
*  On your laptop, you may need to add #define _GNU_SOURCE in the first line of your code. 
*  Please, see comp30570-L13 about pipelining.
*/
#include <stdlib.h>
#include <stdio.h>
#define _GNU_SOURCE

int main() {
FILE* fp = popen ("ps -U root -u root -o pid= -o args=" , "r" ) ;
if (fp == NULL)
/* Handle error */ ;
char path [256] ;
int counter=0;
while (fgets(path, 256, fp ) != NULL) {
        counter++;
        printf( "%d: %s " , counter, path ) ;
}
return pclose(fp) ;
}


