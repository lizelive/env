FROM nvcr.io/nvidia/pytorch:24.01-py3

RUN pip install git+https://github.com/huggingface/diffusers.git@refs/pull/6487/merge transformers accelerate peft bitsandbytes sentencepiece

EXPOSE 8000
COPY --link --from=ghcr.io/lizelive/env/code-serve-web:main /usr/local/bin/code /usr/local/bin/code
