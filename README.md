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
      By default the dockerfile 'Dockerfile' or '*.dockerfile'
      from the current working directory is taken unless
      the file is not explicitely specified with -f.
### start
    Start or attach to container.
### remove
    Remove project + corresponding image

## Init Options
### -f
    Specify dockerfile to use.
    - devharbor init -f arch-ruby
        Takes one of the existing dockerfiles.
    - devharbor init -f /any/path/mydockerfile.dockerfile
        Takes dockerfile from given path

## Start Options
### -a
    Attach to container.
### -k
    Do not cleanup container file system. By default the container is
    automatically removed after the session ends.
