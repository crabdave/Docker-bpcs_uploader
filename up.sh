

#!/bin/sh
        datename=$(date +%Y%m%d-%H%M%S)
        for file in `find . -type f -name "*"`;do 
                dirname=`dirname $file`
                /root/bpcs_uploader/bpcs_uploader.php upload $file $datename/$file
        done
