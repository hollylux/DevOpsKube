#!/bin/bash

go build --tags netgo --ldflags '-extldflags "-lm -lstdc++ -static"' -o ./bin/sayhello ./src/com/blue/sayhello.go
#docker image rm -f brucelu/gosayhello:latest docker.io/brucelu/gosayhello
docker build --no-cache -t brucelu/gosayhello:latest -f ./src/ci/Dockerfile .
docker push brucelu/gosayhello

exit 0