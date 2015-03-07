/* Write a script that takes 1 user argument, and checks if it is:

*  'install': it has to create a subdirectory bin in a current working directory and a script file run.sh there.
*  'uninstall': it has to delete the installed script and directory.
*  For any other argument, it should return the error message "wrong argument". You should use the 'case' command.
*
*  run.sh should be executable. It should print all executable files in the '/etc/init.d/', no directories.
*/
#!/bin/bash
if [ $# -ne 1 ]; then
  echo " <Need an argument of Install or Uninstall>" 1>&2
  exit 1
fi
case "$1" in
  install )
    ! test -d bin && mkdir bin
    if test -r bin/run.sh
        then echo "run.sh already exists"
        exit 1
    else
        echo find /etc/init.d -type f -executable >> bin/run.sh
        chmod 755 bin/run.sh
        exit 0 
    fi
  ;;
  uninstall )
        if test -r bin/run.sh
            then rm bin/run.sh
            rmdir bin
            exit 0
        else
            echo "<File never installed>"       
            exit 1
        fi
  ;;
  * )
    echo "wrong argument"
    exit 1
esac

