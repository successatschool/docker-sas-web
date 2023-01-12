# docker-sas-web

Docker web container definition for main S@S site.

## Build

To test locally before pushing:

    docker build -t successatschool/docker-sas-web:tmp-local .

Remember to point your local config to the `:tmp-local` tag while testing.

## CI builds

We use GitHub Actions to build and push [to Docker Hub](https://cloud.docker.com/u/successatschool/repository/docker/successatschool/docker-sas-web/general)
daily and on changes on the `main` branch.

The repository must have a change pushed or the scheduled action enabled
[via the GitHub UI](https://github.com/successatschool/docker-sas-web/actions/workflows/build-and-push.yaml)
at least every 60 days for updates to continue being built and pushed. We might
want to consider migrating this process to CircleCI to remove this requirement.

The current tag is **successatschool/docker-sas-web:php8.2**.

See [the docs](https://github.com/marketplace/actions/build-and-push-docker-images?version=v2.7.0)
for more on how and why CI and Dependabot are configured within `.github`.

