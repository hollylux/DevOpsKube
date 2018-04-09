#!/bin/bash

go build -o bin/sayhello src/com/blue/sayhello.go
docker build -f cicd/Dockerfile -t brucelu/gosayhello

exit 0