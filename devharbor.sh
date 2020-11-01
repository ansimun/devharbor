#!/usr/bin/bash

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
    dockerfile=""

    while getopts "f:" init_opt; do
      case ${init_opt} in
        f)
          dockerfile="${OPTARG}"
        ;;
      esac
    done

    init $sources "$workingsetsdir/$projectname" $dockerfile
  ;;
  start )
    projectname=$1; shift
    attach=false

    while getopts "a" start_opt; do
      case ${start_opt} in
        a)
          attach=true
        ;;
      esac
    done

    start "$workingsetsdir/$projectname" $attach
  ;;
  help )
    print_help
    exit 0
  ;;
  *)
    echo "devharbor : invalid command $subcommand" 1>&2
    print_help
    exit 1
  ;;
esac
