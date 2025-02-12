#!/bin/bash

# Beszel Agent
docker run --detach --name beszel_agent --hostname beszel_agent --restart always \
  --privileged \
  --publish 45876:45876 \
  --volume /var/run/docker.sock:/var/run/docker.sock:ro \
  --env "PORT=45876" \
  --env "KEY=ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKWHAJwMDs7EF9WA2z6wheZPXeV7u3o7ZhLPw/vaUNk9" \
  henrygd/beszel-agent

# Portainer Agent
docker run --detach --name portainer_agent --hostname portainer_agent --restart always \
  --privileged \
  --publish 9001:9001 \
  --volume /:/host \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume /var/lib/docker/volumes:/var/lib/docker/volumes \
  portainer/agent
