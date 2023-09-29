ARG BASE_IMAGE=debian
FROM ${BASE_IMAGE} as download
RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
    --mount=target=/var/cache/apt,type=cache,sharing=locked \
    rm -f /etc/apt/apt.conf.d/docker-clean \
    && apt-get update \
    &&  apt-get -y --no-install-recommends install wget

# bash Miniforge3-$(uname)-$(uname -m).sh

FROM ${BASE_IMAGE}
ADD ./ /etc/xpie/

RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
    --mount=target=/var/cache/apt,type=cache,sharing=locked <<EOT
#!/usr/bin/env bash
set -ex
rm -f /etc/apt/apt.conf.d/docker-clean
xargs -r -a /etc/xpie/packages.txt echo
apt-get update
apt-get install -y vim wget
EOT

RUN --mount=target=/tmp,type=cache,sharing=locked <<EOT
#!/usr/bin/env bash
set -ex
wget -O /tmp/Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"

EOT

RUN 


# RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
#     --mount=target=/var/cache/apt,type=cache,sharing=locked \
#     rm -f /etc/apt/apt.conf.d/docker-clean \
#     && apt-get update \
#     &&  xargs -r -a /etc/xpie/packages.txt apt-get -y --no-install-recommends install

# RUN wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"