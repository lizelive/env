# syntax=docker/dockerfile:1
FROM busybox as downloader

# vscode_cli_alpine_x64_cli

ADD https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64 /tmp/vscode_cli.tar.gz
RUN tar -xzf /tmp/vscode_cli.tar.gz -C /bin

# RUN pip install transformers

# FROM mcr.microsoft.com/devcontainers/universal:linux
FROM debian
EXPOSE 8000
RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
    --mount=target=/var/cache/apt,type=cache,sharing=locked \
    rm -f /etc/apt/apt.conf.d/docker-clean \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        wget ca-certificates

ENV VSCODE_APPDATA=/run/code/remote

COPY --link --from=downloader /bin/code /usr/local/bin/code
VOLUME ${VSCODE_APPDATA}

WORKDIR /afh
CMD ["/usr/local/bin/code", "serve-web", "--without-connection-token", "--port=8000", "--host=0.0.0.0" ]


# DOCKER_BUILDKIT=1 docker build . -t vscode; docker run --rm -p 127.0.0.1:8000:8000 -v /var/run/docker.sock:/var/run/docker.sock -v vscode-server-data-dir:/vscode-server-data-dir -v user-data-dir:/user-data-dir -v extensions-dir:/extensions-dir -v cli-data-dir:/cli-data-dir vscode
HEALTHCHECK  --interval=1m --timeout=3s \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8000/ || exit 1
