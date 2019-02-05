FROM docker:stable

LABEL "name"="Remote Docker Action"
LABEL "maintainer"="Stephen Coakley <me@stephencoakley.com>"

LABEL "com.github.actions.name"="Remote Docker"
LABEL "com.github.actions.description"="Run remote Docker commands."
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

RUN apk --no-cache add openssh-client

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
