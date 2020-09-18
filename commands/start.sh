#!/usr/bin/bash

function start {
  workingsetsdir="$1"
  projectname="$2"
  attach="$3"

  container_running=true
  container_existing=true;

  id=$(docker ps -q -f name=ruby-dock)
  if [ -z "$id" ]; then
    container_running=false
    id=$(docker ps -aq -f name=ruby-dock)
    if [ -z "$id" ]; then
      container_existing=false;
    fi
  fi

  if [ "$container_existing" = false ]; then
    echo "devharbor : container $projectname not found"
    echo "devharbor : creating and starting container"
    docker run -it -d --name $projectname --mount type=bind,source="$workingsetsdir/$projectname",target=/usr/app $projectname >/dev/null
  elif [ "$container_running" = false ]; then
    echo "devharbor : container $projectname found - not running"
    echo "devharbor : starting container"
    docker container start $projectname >/dev/null
  else
    echo "devharbor : container $projectname found - running"
  fi

  if [ "$attach" = true ]; then
    echo "devharbor : attaching to container"
    winpty docker attach $projectname
  fi
}
