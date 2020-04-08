# inetsim-docker  ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/digitalsleuth/inetsim-docker)
A Docker of inetsim built on ubuntu:latest

Can be run using:
```
docker run -it --rm --name inetsim-docker -p <ip>:<port>:<port> \
-e INETSIM_START_SERVICES=<svc>,<svc> -v <host_folder>:<docker_share> \
digitalsleuth/inetsim-docker
```
       
