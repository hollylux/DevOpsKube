## Setup

* Jenkins, Go, Kubernetes installed on host server

* Source code hosted on github

* CICD files
    cd ~/blws/DevOpsKube
    Go build
        go build --tags netgo --ldflags '-extldflags "-lm -lstdc++ -static"' -o bin/sayhello src/com/blue/sayhello.go
    Dockerfile
        docker build -t brucelu/gosayhello:1.0.0 -f cicd/Dockerfile .
        docker login
        docker push brucelu/gosayhello
        // I'm on RHEL 7, I had to modify /etc/container/registries.conf to change default registries from 
        // registries = ['registry.access.redhat.com']
        // registries = ['docker.io']
        // And restart docker: systemctl restart docker

    Jenkinsfile
    Scripts
        chmod 755 cicd/scripts/build.sh
    Docker
        docker run --rm -it -p 9999:9999 30b225a87eb0



