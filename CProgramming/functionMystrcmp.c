/* Implement a case insensitive function that compares two strings. It should have similar interface and behaviour as strcmp, 
*  except for case insensitivity: int mystrcmp(const char * str1, const char * str2);
*  It should return 0 for strings "test" and "TeSt", like strcmp does for identical strings. It should return 1 for "Ireland" 
*  and "Dublin", and -1 for "Dublin" and "Ireland", because these strings are different, even in the lower case. 
*  The - sign shows that the first character that does not match has a lower lexicographical value in the first string.
*  The submitted code should not contain main. On your laptop you need main to test how mystrcmp works.
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

int mystrcmp(const char* str1, const char* str2) {
   //convert str1 to upper
   char* str1b = malloc((strlen(str1) + 1) * sizeof(char)) ;
   char* str2b = malloc((strlen(str2) + 1) * sizeof(char)) ;
   int i=0;
   int result=0;
   while ((str1[i])!='\0') {
      str1b[i]=toupper(str1[i]);
      i++;
   }
   i=0;
   while ((str2[i])!='\0') {
      str2b[i]=toupper(str2[i]);
     i++;
   }

   result=strcmp(str1b,str2b);
   if(result<0) {
        result=-1;
   }      
   if(result>0) {
        result=1;
   }
   free(str1b);
   free(str2b);
   return result;
} // mystrcmp()

