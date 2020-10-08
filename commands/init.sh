#!/usr/bin/bash

function init {
  workingsetsdir="$1"
  projectname="$2"
  dockerfile="$3"

  # check for docker
  if [ -z "$(command -v docker)" ]; then
    echo "devharbor : docker not found, exit"
    exit 1
  fi

  # check for docker daemon
  # TODO: use docker info > /dev/null 2>&1 instead
  if (! docker stats --no-stream > /dev/null 2>&1); then
    echo "devharbor : docker not running, exit"
    exit 1
  fi

  # create workingsetsdir
  if [ ! -d $workingsetsdir ]; then
    echo "devharbor : create directory $workingsetsdir"
    mkdir -p $workingsetsdir
  fi

  # create project directory
  projectdir="$workingsetsdir/$projectname"
  if [ ! -d $projectdir ]; then
    echo "devharbor : create directory $projectdir"
    mkdir $projectdir
  fi

  echo "devharbor : create image >>"
  docker build -t $projectname -f $dockerfile -
  echo "<<"
}
