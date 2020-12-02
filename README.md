## Name

devharbor

## Synopsis

```bash
devharbor <operation> <project-name> [options]
devharbor help
```

## Operations
### init
    Initialize a new project and create new image.
### start
    Start or attach to container.
### remove
    Remove project + corresponding image

## Init Options
### -f
    Specify dockerfile to use.
    - devharbor init
        Takes dockerfile from working directory.
        First matching of 'Dockerfile' or '*.dockerfile'
    - devharbor init -f arch-ruby
        Takes one of the existing dockerfiles.
    - devharbor init -f /any/path/mydockerfile.dockerfile
        Takes dockerfile from given path

## Start Options
### -a
    Attach to container after starting it.
