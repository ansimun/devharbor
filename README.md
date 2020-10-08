## Name

devharbor

## Synopsis

    devharbor \<operation\> \<project-name\> [options]
    devharbor help

## Operations
### init
    Initialize a new project and creates an image
    or updates an existing project.
### start
    Start or attach to container.
### help
    Print help

## Init Options
### -f
    Specify dockerfile to use.
    Take default (arch-default): devharbor init
    Use one of the existing    : devharbor init -f arch-ruby
    Use file from path         : devharbor init -f /any/path/mydockerfile.dockerfile
### -s
    Path to the source directory.
## Start Options
### -a
    Attach to container after starting it.
