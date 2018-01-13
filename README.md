# elog-debian
elog hosted in a Debian docker instance.  Suitable to run on a synology box.

First tested and working version is v0.5.

## Getting it working on a synology box
This docker can be spun up on any computer.  To get it working on a synology box there are a few things you need to do.  

1. Go into the synolgy DSM and download the container image from within docker;
2. Make a folder in a suitable location and a user, apply ownership of this folder to that user.  This will apply a user name and a UID and GID to the folder and its contents.
3. Place config files and resources in this folder
4. Set up the docker image as a container, you need to add folder from above mounted to the location /home within the docker, also set the port mapping from 8080 to whatever you want to use to access it outside the docker (i.e. for example 192.1.123:8080
5. Launch docker and go into Details -> Terminal -> Create.  This should launch a bash instance, run "ls -al" to see what UID synology gave your files. Also run "id elog" to see what UID is assigned with the docker.  You need these two numbers to be the same, if they are note the same run "moduser -u <UID of synology> elog". Check change is made with "id -al".
5. Restart docker and check if persistant entries are created in a folder mounted from your synology. If they do then you are done.

