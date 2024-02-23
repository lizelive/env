FROM nvcr.io/nvidia/pytorch:24.01-py3

RUN pip install git+https://github.com/huggingface/diffusers.git@refs/pull/6487/merge transformers accelerate peft bitsandbytes sentencepiece

EXPOSE 8000
COPY --link --from=ghcr.io/lizelive/env/code-serve-web:main /usr/local/bin/code /usr/local/bin/code

CMD ["/usr/local/bin/code", "serve-web", "--without-connection-token", "--port=8000", "--host=0.0.0.0" ]
HEALTHCHECK  --interval=1m --timeout=3s \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8000/ || exit 1
