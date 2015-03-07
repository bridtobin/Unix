/* Use shell script to implement a word counter without using wc. It should take a file as input and output the number of words in it. 
   You should use a loop.
   */
if [ $# -ne 1 ]; then
  echo "<Please add filename as argument>" 
  exit 1
fi
 
if [ -f "$1" ]; then           
  A=0
  for word in $(<$1)
  do
     let A++
  done
  echo "$A"
  exit 0
else
  echo "<This is not a file>"
  exit 1
fi 