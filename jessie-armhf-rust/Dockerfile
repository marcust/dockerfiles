FROM armhfbuild/debian:jessie

ARG RUST_BUILD

RUN apt-get update &&\
    apt-get -y upgrade &&\
    apt-get -y install wget build-essential &&\
    wget -O /tmp/rust-${RUST_BUILD}.tar.gz https://sothr.com/RustBuild/armv7/rust/${RUST_BUILD}/latest &&\
    wget -O /tmp/cargo-${RUST_BUILD}.tar.gz https://sothr.com/RustBuild/armv7/cargo/${RUST_BUILD}/latest &&\
    wget -O /tmp/librust-${RUST_BUILD}.tar.gz https://sothr.com/RustBuild/armv7/rustlib/${RUST_BUILD}/latest &&\
    tar xvzf /tmp/rust-${RUST_BUILD}.tar.gz -C /usr &&\
    tar xvzf /tmp/cargo-${RUST_BUILD}.tar.gz -C /usr &&\
    tar xvzf /tmp/librust-${RUST_BUILD}.tar.gz -C /usr &&\
    rm -f /tmp/*.tar.gz &&\
    apt-get clean &&\
    rm -rfv /usr/share/doc &&\
    rm -rfv /var/cache/apt /var/lib/apt/lists/* /tmp/* /var/tmp/*

