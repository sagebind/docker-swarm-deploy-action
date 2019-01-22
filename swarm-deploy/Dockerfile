FROM docker:stable

LABEL "name"="Docker Swarm Deploy Action"
LABEL "maintainer"="Stephen Coakley <me@stephencoakley.com>"

LABEL "com.github.actions.name"="Docker Swarm Deploy Action"
LABEL "com.github.actions.description"="Deploys stuff to a Docker Swarm."
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

RUN apk --no-cache add openssh-client

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
