

# Pull base image  
FROM centos:latest
  
MAINTAINER crabdave "calorie.david@gmail.com"  

# Usage: USER [UID]
USER root

# Usage: WORKDIR /path
WORKDIR /data/docker/

# Install php git
RUN yum install glibc php git -y
# RUN yum install glibc.i686   www.cit.cn
RUN cd /root && git clone https://github.com/oott123/bpcs_uploader.git
RUN cd /root/bpcs_uploader && chmod +x bpcs_uploader.php

# add daemon script
ADD  rename.sh /root/
ADD  up.sh /root/
ADD  start.sh /root/

#authorization
RUN chmod 755 /root/rename.sh 
RUN chmod 755 /root/up.sh
RUN chmod 755 /root/start.sh 

# modify conf  
ENTRYPOINT ["/root/start.sh"]
