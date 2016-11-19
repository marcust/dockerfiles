FROM stcm/arm64-debian:jessie

ARG RUST_BUILD

RUN apt-get update &&\
    apt-get -y upgrade &&\
    apt-get -y install wget build-essential curl file sudo &&\
    curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain ${RUST_BUILD} &&\
    mv -v /root/.cargo/bin/* /usr/bin
    apt-get clean &&\
    rm -rfv /usr/share/doc &&\
    rm -rfv /var/cache/apt /var/lib/apt/lists/* /tmp/* /var/tmp/*

