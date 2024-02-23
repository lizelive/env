#!/bin/sh
# -v "$HOME:$HOME:ro" \
docker run --name=env --rm -it \
--ipc=host --net=host \
--gpus all \
--ulimit memlock=-1 --ulimit=stack=67108864 \
-u $(id -u):$(id -g) -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro \
-v "$HOME/.vscode:$HOME/.vscode" \
-v "$HOME/.vscode-server:$HOME/.vscode-server" \
-v "$HOME/Documents:$HOME/Documents" \
-v "$HOME/.cache:$HOME/.cache" \
$(docker build nvidia-pytorch -q)
