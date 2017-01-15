#!/bin/sh
docker build -t="chingchangli/developer" .
docker run -v /home/chingchangli/Developer:/home/chingchangli/Developer -t -i chingchangli/developer /bin/zsh
