#!/usr/bin/bash

function print_help {
      echo "Usage: devharbor <operation> <project-name> [options]"
      echo ""
      echo "Operations"
      echo "    init"
      echo "        Initialize a new project and creates an image"
      echo "    start"
      echo "        Start or attach to container"
      echo "    help"
      echo "        Print this help"
      echo "Init Options"
      echo "    -f"
      echo "        Specify dockerfile to use."
      echo "        Take default (arch-default): devharbor init"
      echo "        Use one of the existing    : devharbor init -f arch-ruby"
      echo "        Use file from path         : devharbor init -f /any/path/mydockerfile.dockerfile"
      echo "    -s"
      echo "        Path to the source directory."
      echo "Start Options"
      echo "    -a"
      echo "        Attach to container after starting it."
}
