Main Project [StatuZpage](https://github.com/nopp/statuzpage)

# StatuZpage Agent

Responsible for monitoring all urls.

## Configurations:
Default config dir: /etc/statuzpage-agent/config.json
* statuzpage-api: ip:port
* mysql-host: ip
* mysql-user: mysql user
* mysql-password: mysql password
* mysql-db: statuzpage(default)
* token: the same token configured on StatuZpage API

## Build:
$ go build

## Start
$ ./statuzpage-agent

## Docker Hub Image
https://hub.docker.com/r/noppp/statuzpage-agent
