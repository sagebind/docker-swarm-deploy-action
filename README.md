# Docker Swarm Deploy Action

A [GitHub Action](https://github.com/features/actions) that enables you to publish your app as a [Docker stack](https://docs.docker.com/engine/swarm/stack-deploy/) to a remote Docker swarm.

## Usage

Below is a brief example on how the action can be used:

```yaml
- name: Deploy to swarm
  uses: sagebind/docker-swarm-deploy-action@1.0.0
  env:
    DOCKER_REMOTE_HOST: ssh://user@myswarm.com
    DOCKER_SSH_PRIVATE_KEY: ${{ secrets.DOCKER_SSH_PRIVATE_KEY }}
    DOCKER_SSH_PUBLIC_KEY: ${{ secrets.DOCKER_SSH_PUBLIC_KEY }}
  with:
    args: stack deploy --compose-file stack.yaml coolapp
```

The `args` are passed in as args to the `docker` command after connecting to the remote swarm. To specify how to connect to your swarm, you must set the `DOCKER_REMOTE_HOST` environment variable, which takes the same syntax as the [`--host` command line flag](https://docs.docker.com/engine/reference/commandline/cli/).

Below are all of the supported environment variables. Some variables used to authenticate with your swarm should be kept private, and should be configured as secrets for security.

| Variable | Description |
| - | - |
| `DOCKER_REMOTE_HOST` | Docker daemon socket to connect to. |
| `DOCKER_SSH_PUBLIC_KEY` | When connecting to Docker over SSH, this must contain the SSH public key of the server for verification. |
| `DOCKER_SSH_PRIVATE_KEY` | When connecting to Docker over SSH, this must contain the SSH private key to use to connect. |

If you are deploying any private Docker images, you can use the [Docker Login](https://github.com/marketplace/actions/docker-login) action to first log in to your private registry, and then provide the `--with-registry-auth` flag to `docker stack deploy` to use the logged in credentials during deployment.

## License

This project is licensed under the MIT license. See the [LICENSE](LICENSE) file for details.
