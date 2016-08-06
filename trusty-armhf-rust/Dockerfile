FROM armhf/ubuntu:trusty

ARG RUST_BUILD

RUN apt-get update &&\
    apt-get -y upgrade &&\
    apt-get -y install wget build-essential curl file sudo &&\
    curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --channel=${RUST_BUILD} &&\
    apt-get clean &&\
    rm -rfv /usr/share/doc &&\
    rm -rfv /var/cache/apt /var/lib/apt/lists/* /tmp/* /var/tmp/*

