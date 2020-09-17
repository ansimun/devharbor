#!/usr/bin/bash

function print_help {
      echo "Usage: devharbor <COMMAND> <project> [OPTIONS]"
      echo ""
      echo "  COMMAND"
      echo "  ======="
      echo "  init    - initialize a new project and creates an image"
      echo "  start   - start project container or attach"
      echo "  clean   - remove project image and corresponding container"
      echo ""
      echo "  OPTIONS"
      echo "  ======="
      echo "  init :"
      echo "  -f      - dockerfile, path or name for default files"
      echo "  start:"
      echo "  clean:"
}
