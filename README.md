# Docker-bpcs_uploader

#mkdir 
mkdir -p /data/docker/

#add dir to White List 
chcon -Rt svirt_sandbox_file_t /data/docker/

#build dockerfile
docker build -t bpcs_uploader .

#init
docker run -it -e "container=container-bpcs_uploader" --name container-bpcs_uploader -h container-bpcs_uploader -v /data/docker:/data/docker bpcs_uploader

与容器交互对bpcs进行权限配置：
Launch your favorite web browser and visit https://openapi.baidu.com/device
Input suqj8zyf as the user code if asked.
After granting access to the application, come back here and press Enter to continue.

Access Granted. Your Storage Status: 
Enjoy!

#stop container
docker stop container-bpcs_uploader

#start container in background
docker start container-bpcs_uploader

#touch a file for uploading
touch /data/docker/upload/test.txt

#check the logs of the container
docker logs --tail 0 -f container-bpcs_uploader

#end
Enjoy it!
