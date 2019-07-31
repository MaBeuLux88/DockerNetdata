# Use the official version instead of this one!

In 2016, the official netdata project didn't support Docker builds officially which is the reason why I made this repository at the time.

Now, they support officially Docker and you can find more information in their [Github repo](https://github.com/netdata/netdata/tree/master/packaging/docker) or in their [Docker Hub page](https://hub.docker.com/r/netdata/netdata).

Official command line.

```
docker run -d --name=netdata \
  -p 19999:19999 \
  -v /etc/passwd:/host/etc/passwd:ro \
  -v /etc/group:/host/etc/group:ro \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  --cap-add SYS_PTRACE \
  --security-opt apparmor=unconfined \
  netdata/netdata
```

# DockerNetdata

Old repository for the automated build on Docker Hub. Use the official version instead.

My old command line.

```
docker run -d \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  --cap-add SYS_PTRACE \
  -h $(hostname) \
  -p 19999:19999 \
  --name netdata \
  mabeulux88/netdata:latest
```

Then open a browser : http://localhost:19999

