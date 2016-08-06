
#!/bin/sh

find . -name "* *"|
while read name;do
        na=$(echo $name | tr ' ' '_')
        mv "$name" $na
done

for file in `find . -type f -name "*"`;do 
dirname=`dirname $file`
#newfile=`echo $file | sed 's,\/,_,g'|sed 's,\._,,g'`
 i=`expr $i + 1000`;
 P="${file##*.}"
echo $file $dirname/$i.$P;

mv $file $dirname/$i.$P;
done
