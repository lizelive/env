#!/bin/sh
# -v "$HOME:$HOME:ro" \

name=mlws

docker rm -f $name || true
args="-d"
# args="${args} -it --rm"
args="${args} --net=host"
# args="${args} -p=127.0.0.1:8000:8000"

docker run --name=$name $args \
--ipc=host \
--gpus=all --ulimit=memlock=-1 --ulimit=stack=67108864 \
-u $(id -u):$(id -g) -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro \
-v "$HOME/fakehome:$HOME" \
-v "$HOME/.vscode:$HOME/.vscode" \
-v "$HOME/.vscode-server:$HOME/.vscode-server" \
-v "$HOME/Documents:$HOME/Documents" \
-v "$HOME/.cache:$HOME/.cache" \
-w "$HOME/Documents" \
$(docker build nvidia-pytorch --pull -q)
