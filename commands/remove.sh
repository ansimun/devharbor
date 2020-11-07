#!/usr/bin/bash

function remove {
  projectfile="$1"

  if [ ! -f $projectfile ]; then
    echo "devharbor : failed to load project $projectname, exit"
    exit 1
  fi

  # actually this is not really required here
  source $projectfile

  projectname=$(basename $projectfile)

  id=$(docker ps -q -f name="$projectname")
  if [ ! -z "$id" ]; then
    echo "devharbor : container $projectname running, try to stop it"
    docker container stop $projectname
  fi

  id=$(docker ps -aq -f name="$projectname")
  if [ ! -z "$id" ]; then
    echo "devharbor : removing container $projectname"
    docker container rm -f $projectname
  fi

  echo "devharbor : removing image $projectname"
  docker rmi $projectname

  echo "devharbor : removing projectfile"
  rm $projectfile
}
