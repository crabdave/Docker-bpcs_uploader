

mkdir -p /data/docker/youtube /data/docker/upload

chcon -Rt svirt_sandbox_file_t /data/docker/

chmod 755 /root/Docker-bpcs_uploader/move.sh

echo "*/10 * * * * /bin/sh /root/Docker-bpcs_uploader/move.sh" >> /var/spool/cron/root
