# syntax=docker/dockerfile:1
FROM busybox as downloader

# vscode_cli_alpine_x64_cli

ADD https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64 /tmp/vscode_cli.tar.gz
RUN tar -xzf /tmp/vscode_cli.tar.gz -C /bin

FROM nvcr.io/nvidia/pytorch:23.09-py3

# code cli
RUN wget -c "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64" -O - | tar -xz -C /usr/local/bin

RUN pip install transformers

EXPOSE 8000
COPY --link --from=downloader /bin/code /usr/local/bin/code

VOLUME "/root/.cache/"
CMD ["/usr/local/bin/code", "serve-web", "--without-connection-token", "--port=8000", "--host=0.0.0.0" ]
