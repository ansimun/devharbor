#!/usr/bin/bash

function start {
  projectfile="$1"
  attach="$2"
  keep="$3"
  projectname=$(basename $projectfile)

  if [ ! -f $projectfile ]; then
    echo "devharbor : failed to load project $projectname, exit"
    exit 1
  fi

  source $projectfile

  if [ ! -d $DEVHARBOR_PROJECTDIR ]; then
    echo "devharbor : project directory $DEVHARBOR_PROJECTDIR not existing, exit"
    exit 1
  fi

  container_running=true
  container_existing=true;

  id=$(docker ps -q -f name="$projectname")
  if [ -z "$id" ]; then
    container_running=false
    id=$(docker ps -aq -f name="$projectname")
    if [ -z "$id" ]; then
      container_existing=false;
    fi
  fi

  if [ "$container_existing" = false ]; then
    echo "devharbor : container $projectname not found"
    echo "devharbor : creating and starting container"
    if [ "$keep" = true ]; then
      docker run -it -d --name $projectname --mount type=bind,source="$DEVHARBOR_PROJECTDIR",target=/usr/app $projectname >/dev/null
    else
      docker run --rm -it -d --name $projectname --mount type=bind,source="$DEVHARBOR_PROJECTDIR",target=/usr/app $projectname >/dev/null
    fi
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
