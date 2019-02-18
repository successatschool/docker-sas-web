# docker-sas-web

Docker web container definition for main S@S site.

## Build

To test locally before pushing:

    docker build -t successatschool/docker-sas-web:tmp-local .

Remember to point your local config to the `:tmp-local` tag while testing.

## Generate new automatic Docker Hub build

* Push to `master`, unless planning to use a new tag.
* The [Docker Hub repository](https://cloud.docker.com/u/successatschool/repository/docker/successatschool/docker-sas-web/general)
has an automated build from master on GitHub. Current tag is **successatschool/docker-sas-web:php7.2**.
