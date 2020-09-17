#!/usr/bin/bash

# check for docker
if [ -z "$(command -v docker)" ]; then
  echo "devharbor : docker not found, exit"
  exit 1
fi

# check for docker daemon
# TODO: use docker info > /dev/null 2>&1 instead
if (! docker stats --no-stream > /dev/null 2>&1); then
  echo "devharbor : docker not running, start docker daemon and try again"
exit 1
fi

sources="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

pushd "$sources/commands" >/dev/null
source print_help.sh
source init.sh
source start.sh
popd >/dev/null

while getopts ":h" opt; do
  case ${opt} in
    h )
      print_help
      exit 0
    ;;
    \? )
      echo "devharbor : invalid option -$OPTARG" 1>&2
      print_help
      exit 1
  esac
done

workingsetsdir="$HOME/.devharbor"

command=$1; shift

case "$command" in
  init )
    projectname=$1; shift
    dockerfile="$sources/docker/arch-default.dockerfile"

    while getopts "f:" init_opt; do
      case ${init_opt} in
        f)
          dockerfile="${OPTARG}"
          if [ ! -f "$dockerfile" ]; then
            dockerfile="$sources/docker/${OPTARG}.dockerfile"
          fi
        ;;
      esac
    done

    init $workingsetsdir $projectname $dockerfile
  ;;
  start )
    projectname=$1; shift

    start $workingsetsdir $projectname
  ;;
  *)
    echo "ruby-dock : invalid command $subcommand" 1>&2
    print_help
    exit 1
  ;;
esac
