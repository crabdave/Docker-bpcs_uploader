


# Pull base image  
FROM centos:latest
  
MAINTAINER crabdave "calorie.david@gmail.com"  

# Usage: USER [UID]
USER root

# Usage: WORKDIR /path
WORKDIR /data/docker/upload

# Install php git
RUN yum install php git vixie-cron crontabs -y
RUN cd /root && git clone https://github.com/oott123/bpcs_uploader.git
RUN cd /root/bpcs_uploader && chmod +x bpcs_uploader.php

# add daemon script
ADD  up.sh /root/

#authorization
RUN chmod 755 /root/up.sh 

# add cron
RUN echo  "*/1 * * * * /root/up.sh"  >> /var/spool/cron/root
RUN sed -i "s/required/sufficient/g" /etc/pam.d/crond
RUN crontab /var/spool/cron/root

# modify conf  
#ENTRYPOINT ["/root/bpcs_uploader/bpcs_uploader.php", "init"]
