# Docker Swarm Deploy Action

A [GitHub Action](https://github.com/features/actions) that enables you to publish your app as a [Docker stack](https://docs.docker.com/engine/swarm/stack-deploy/) to a remote Docker swarm.

## Example

Below is a brief example on how the action can be used:

```yaml
- name: Deploy to swarm
  uses: sagebind/docker-swarm-deploy-action@v2
  with:
    remote_host: ssh://user@myswarm.com
    ssh_private_key: ${{ secrets.DOCKER_SSH_PRIVATE_KEY }}
    ssh_public_key: ${{ secrets.DOCKER_SSH_PUBLIC_KEY }}
    args: stack deploy --compose-file stack.yaml coolapp
```

If you are deploying any private Docker images, you can use the [Docker Login](https://github.com/marketplace/actions/docker-login) action to first log in to your private registry, and then provide the `--with-registry-auth` flag to `docker stack deploy` to use the logged in credentials during deployment.

## Inputs

Below are all of the supported inputs. Some inputs used to authenticate with your swarm should be kept private, and should be supplied as secrets for security.

### `args`

Arguments to pass to the `docker` command after connecting to the remote swarm.

### `remote_host`

Specifies how to connect to your swarm with a Docker host to connect to, using the same syntax as the Docker [`--host` command line flag](https://docs.docker.com/engine/reference/commandline/cli/). This must be a manager node in your swarm for most operations to work.

### `ssh_public_key`

When connecting to Docker over SSH, this must contain the SSH public key of the server for verification. Optional.

### `ssh_private_key`

When connecting to Docker over SSH, this must contain the SSH private key to use to connect. Optional.

## License

This project is licensed under the MIT license. See the [LICENSE](LICENSE) file for details.
