# docker-sas-web

**Docker web container definition for main S@S site.**

This approximately reflects the dependencies used on the deployed EveryCity server, and is currently used to help provide a reliable and consistent local dev environment across systems.

## Build

To test locally before pushing:

    docker build -t successatschool/docker-sas-web:latest .

## Generate new automatic Docker Hub build

* Push to master
* The [Docker Hub repository](https://hub.docker.com/r/successatschool/docker-sas-web/) has an automated build from GitHub master to Docker Hub **successatschool/docker-sas-web:latest**
