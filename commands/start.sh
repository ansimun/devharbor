#!/usr/bin/bash

function start {
  workingsetsdir="$1"
  projectname="$2"

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

  if [ "$container_running" = false ] && [ "$container_existing" = false ]; then
    echo "ruby-dock : creating + starting container ruby-dock"
    winpty docker run -it --name $projectname --mount type=bind,source="$workingsetsdir/$projectname",target=/usr/app $projectname
  elif [ "$container_running" = true ]; then
    echo "ruby-dock : attaching to container $projectname"
    winpty docker attach $projectname
  elif [ "$container_existing" = true ]; then
    echo "ruby-dock : starting container ruby-dock"
    docker container start $projectname >/dev/null
    winpty docker attach $projectname
  fi
}
