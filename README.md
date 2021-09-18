# docker-sas-web

Docker web container definition for main S@S site.

## Build

To test locally before pushing:

    docker build -t successatschool/docker-sas-web:tmp-local .

Remember to point your local config to the `:tmp-local` tag while testing.

## CI builds

We use GitHub Actions to build and push [to Docker Hub](https://cloud.docker.com/u/successatschool/repository/docker/successatschool/docker-sas-web/general)
daily and on changes on the `main` branch.

The current tag is **successatschool/docker-sas-web:php7.4**.

See [the docs](https://github.com/marketplace/actions/build-and-push-docker-images?version=v2.7.0)
for more on how and why CI and Dependabot are configured within `.github`.

