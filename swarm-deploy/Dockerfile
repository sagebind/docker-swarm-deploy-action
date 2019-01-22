FROM docker:stable

LABEL "name"="Docker Swarm Deploy Action"
LABEL "maintainer"="Stephen Coakley <me@stephencoakley.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Docker Swarm Deploy Action"
# LABEL "com.github.actions.description"="Wraps the Docker CLI to enable Docker commands."
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
