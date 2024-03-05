FROM nvcr.io/nvidia/pytorch:24.02-py3

RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
    --mount=target=/var/cache/apt,type=cache,sharing=locked \
    rm -f /etc/apt/apt.conf.d/docker-clean \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        sudo doom-dsda freeglut3-dev

RUN --mount=type=cache,target=/root/.cache \
pip install \
	git+https://github.com/huggingface/diffusers.git@refs/pull/6487/merge \
	transformers accelerate peft bitsandbytes sentencepiece optimum[onnxruntime-gpu] onnxruntime-gpu \
	git+https://github.com/AcademySoftwareFoundation/openexr.git \
	vizdoom \
	--extra-index-url https://aiinfra.pkgs.visualstudio.com/PublicPackages/_packaging/onnxruntime-cuda-12/pypi/simple/

EXPOSE 8000
COPY --link --from=ghcr.io/lizelive/env/code-serve-web:main /usr/local/bin/code /usr/local/bin/code

# CMD ["/usr/local/bin/code", "serve-web", "--port=8000", "--host=0.0.0.0", "--without-connection-token" ]
# HEALTHCHECK  --interval=1m --timeout=3s CMD wget --no-verbose --tries=1 --spider http://localhost:8000/ || exit 1
 CMD ["/usr/local/bin/code", "tunnel"]
