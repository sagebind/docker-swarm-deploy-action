#!/bin/sh
set -eu

printenv | grep DOCKER_HOST

if [ -z "$DOCKER_HOST" ]; then
    echo "DOCKER_HOST is required!"
    exit 1
fi

# If a private SSH key is provided for an SSH-based connection, register it with the SSH agent.
if [ -n "$DOCKER_SSH_KEY" ]; then
    echo "Registering SSH private key..."

    mkdir -p "$HOME/.ssh"

    printf 'Host *\n\tStrictHostKeyChecking no\n' >> "$HOME/.ssh/config"
    chmod 400 "$HOME/.ssh/config"

    printf '%s' "$DOCKER_SSH_KEY" > "$HOME/.ssh/docker"
    chmod 600 "$HOME/.ssh/docker"

    eval $(ssh-agent)
    ssh-add "$HOME/.ssh/docker"
fi

echo "Deploying to $DOCKER_HOST..."

docker --debug stack deploy "$@"
