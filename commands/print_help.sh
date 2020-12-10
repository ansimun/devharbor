#!/usr/bin/bash

function print_help {
      echo "Name"
      echo "    devharbor"
      echo ""
      echo "Synopsis"
      echo "    devharbor <operation> <project-name> [options]"
      echo "    devharbor help"
      echo ""
      echo "Operations"
      echo "    init"
      echo "        Initialize a new project and create new image."
      echo "        By default the dockerfile 'Dockerfile' or '*.dockerfile'"
      echo "        from the current working directory is taken unless"
      echo "        the file is not explicitely specified with -f."
      echo "    start"
      echo "        Start or attach to container."
      echo "    remove"
      echo "        Remove project + corresponding image"
      echo ""
      echo "Init Options"
      echo "    -f"
      echo "        Specify dockerfile to use."
      echo "        - One of the existing    : devharbor init -f arch-ruby"
      echo "        - From path              : devharbor init -f /any/path/mydockerfile.dockerfile"
      echo ""
      echo "Start Options"
      echo "    -a"
      echo "        Attach to container after starting it."
      echo "    -k"
      echo "        Do not cleanup container file system. By default the container is"
      echo "        automatically removed after the session ends."
}
