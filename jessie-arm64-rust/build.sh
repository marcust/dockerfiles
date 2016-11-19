#!/bin/sh

set -ue;

SCRIPT_DIR=$(dirname $0)

cd ${SCRIPT_DIR};

NAME=marcust/$(basename $(pwd))

for build in nightly beta stable; do
    docker build --no-cache --pull --build-arg RUST_BUILD=${build} -f Dockerfile -t ${NAME}:${build} .;
    docker push ${NAME}:${build};
    VERSION=$(docker run ${NAME}:${build} rustc -V  | cut -d ' ' -f 2)
    docker tag ${NAME}:${build} ${NAME}:${VERSION};
    docker push ${NAME}:${VERSION}
    docker tag ${NAME}:${VERSION} ${NAME}:latest;
    docker push ${NAME}:latest
done

/home/marcus/bin/docker-container-clean
/home/marcus/bin/docker-image-clean-full

