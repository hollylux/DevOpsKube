#!/bin/bash

go build --tags netgo --ldflags '-extldflags "-lm -lstdc++ -static"' -o bin/sayhello src/com/blue/sayhello.go
docker build -t brucelu/gosayhello -f cicd/Dockerfile .
docker push brucelu/gosayhello

exit 0