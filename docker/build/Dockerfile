FROM v8tix/atrous:v1.0.1 AS puller
RUN ["/bin/bash", "-c", "mkdir /home/v8tix/src"]
ADD --chown=v8tix:v8tix ./scripts /home/v8tix/scripts
RUN ["/bin/bash", "-c", "chmod +x -R /home/v8tix/scripts"]
WORKDIR /home/v8tix/src
RUN ["/bin/bash", "-c", "git clone git@github.com:v8tix/mallbots-payments.git ."]
RUN ["/bin/bash", "-c", "git checkout tags/v1.0.0"]
RUN ["/bin/bash", "-c", "mv /home/v8tix/scripts/* /home/v8tix/src"]
RUN ["/bin/bash", "-c", "/home/v8tix/src/gen_build_go_script.sh"]

FROM golang:1.20.5-bullseye AS builder
RUN ["/bin/bash", "-c", "mkdir /src"]
WORKDIR /src
COPY --from=puller /home/v8tix/src .
RUN ["/bin/bash", "-c", "./build_go.sh"]

FROM bash:5.2.15-alpine3.18
LABEL org.opencontainers.image.title="mallbots-payments" \
      org.opencontainers.image.authors="Marco Almeida <info@v8tix.com>" \
      org.opencontainers.image.vendor="V8TIX"
COPY --from=builder /bin/payments /bin
ADD ./entrypoint/entrypoint.sh /bin/entrypoint.sh
ENTRYPOINT ["/bin/entrypoint.sh"]
EXPOSE 8080
