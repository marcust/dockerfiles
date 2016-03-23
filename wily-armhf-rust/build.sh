#!/bin/sh

set -ue;

SCRIPT_DIR=$(dirname $0)

cd ${SCRIPT_DIR};

NAME=marcust/wily-armhf-rust

for build in stable beta nightly; do
    docker build --no-cache --pull -f Dockerfile.${build} -t ${NAME}:${build} .;
    docker push ${NAME}:${build};
    VERSION=$(docker run ${NAME}:${build} /usr/bin/rustc -V  | cut -d ' ' -f 2)
    docker tag -f ${NAME}:${build} ${NAME}:${VERSION};
    docker push ${NAME}:${VERSION}
    docker tag -f ${NAME}:${VERSION} ${NAME}:latest;
    docker push ${NAME}:latest
done

/home/marcus/bin/docker-container-clean
/home/marcus/bin/docker-image-clean-full

