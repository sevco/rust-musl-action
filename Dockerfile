ARG TOOLCHAIN
FROM emk/rust-musl-builder:${TOOLCHAIN}

USER root

ENV CARGO_HOME=/opt/rust/cargo

RUN mkdir -p /github
RUN useradd -m -d /github/home -u 1001 github

RUN env CARGO_HOME=/opt/rust/cargo cargo install -f cargo-rpm && \
    rm -rf /opt/rust/cargo/registry/

RUN echo '\n[net] \n\
    git-fetch-with-cli = true' >> /opt/rust/cargo/config

ADD entrypoint.sh cleanup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh && \
    chmod +x /usr/local/bin/cleanup.sh 

USER github
WORKDIR /github/home

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
