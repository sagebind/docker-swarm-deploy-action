#!/bin/sh

if [ -z "$DEPLOY_PRIVATE_KEY" ]; then
    echo "Private SSH key is required!"
    exit 1
fi

if [ -z "$DOCKER_HOST" ]; then
    echo "DOCKER_HOST is required!"
    exit 1
fi

eval $(ssh-agent)

# Add given SSH key secret to the SSH agent
printf "%s" "$DEPLOY_PRIVATE_KEY" > $HOME/.ssh/deploy
ssh-add $HOME/.ssh/deploy

exec docker stack deploy "$@"
