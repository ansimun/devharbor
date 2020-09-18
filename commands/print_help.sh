#!/usr/bin/bash

function print_help {
      echo "Usage: devharbor <COMMAND> <project> [OPTIONS]"
      echo ""
      echo "  COMMAND"
      echo "  ======="
      echo "  init    - initialize a new project and creates an image"
      echo "  -f      - dockerfile"
      echo "            devharbor init -f arch-ruby"
      echo "            devharbor init -f /any/path/mydockerfile.dockerfile"
      echo ""
      echo "  start   - start project container or attach"
      echo "  -a      - attach to container"
      echo ""
}
