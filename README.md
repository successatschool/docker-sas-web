# docker-sas-web

Docker web container definition for main S@S site.

## Build

To test locally before pushing:

    docker build -t successatschool/docker-sas-web:tmp-local .

Remember to point your local config to the `:tmp-local` tag while testing.

## Generate new automatic Docker Hub build

* Push to `php7.2`
* The [Docker Hub repository](https://cloud.docker.com/u/successatschool/repository/docker/successatschool/docker-sas-web/general)
has an automated build from this branch on GitHub. Curren tag is **successatschool/docker-sas-web:php7.2**
