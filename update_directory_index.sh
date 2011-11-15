#!/bin/bash
 
function print_file_if_in_git {
  if [[ `git ls-files $1` != '' ]]
  then
    echo -e "<a href=\"$1\">$1</a>"
  fi
}
for DIR in $(find . -type d); do
  if [[ `git ls-files ${DIR}` != '' ]]
  then
    pushd $DIR
    (
      echo -e "<html>\n<body>\n<h1>Index of `echo $DIR|cut -c3-`</h1>\n<hr/>\n<pre>"
      echo -e "<a href=\"..\">..</a>"
      ls -1p . | grep -v "^index\.html$" | while read i ; do print_file_if_in_git "$i" ; done
      echo -e "</pre>\n</body>\n</html>"
    ) > "index.html"  
    popd
  fi
done


