# DockerNetdata
Repository for the automated build on Docker Hub

Netdata has his own repository : https://github.com/firehol/netdata

Run a container : docker run -d -v /proc:/host/proc:ro -v /sys:/host/sys:ro --cap-add SYS_PTRACE -h $(hostname) -p 19999:19999 --name netdata mabeulux88/netdata:latest

Then open a browser : http://localhost:19999

