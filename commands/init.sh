#!/usr/bin/bash

function init {
  scriptsources="$1"
  projectfile="$2"
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

  if [ -z $dockerfile ]; then
    files=($(ls Dockerfile *.dockerfile))
    if [ ${#files[@]} -eq 0 ]; then
      echo "devharbor : no dockerfile found, exit"
      exit 1
    fi
    dockerfile=$(realpath ${files[0]})
  elif [ ! -f $dockerfile ]; then
    dockerfile="$scriptsources/docker/$dockerfile.dockerfile"
    if [ ! -f $dockerfile ]; then
      echo "devharbor : $dockerfile not found, exit"
      exit 1
    fi
  fi

  workingsetsdir=$(dirname $projectfile)

  if [ ! -d $workingsetsdir ]; then
    echo "devharbor : create directory $workingsetsdir"
    mkdir -p $workingsetsdir
  fi

  if [ ! -f $projectfile ]; then
cat <<EOF > $projectfile
DEVHARBOR_DOCKERFILE="$dockerfile"
DEVHARBOR_PROJECTDIR="$(pwd)"
EOF
  fi

  projectname=$(basename $projectfile)
  echo "devharbor : create image >>"
  docker build -t $projectname -f $dockerfile .
  echo "<<"
}
