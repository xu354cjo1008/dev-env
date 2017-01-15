#!/bin/sh
docker build -t="chingchangli/developer" .
docker run -v /home/chingchangli/Developer:/home/chingchangli/working -t -i chingchangli/developer /bin/zsh
