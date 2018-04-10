## Setup

* Jenkins, Go, Kubernetes installed on host server

* Source code hosted on github

* CI files
    /root/.jenkins/workspace/DevOpsKube/
    cd ~/blws/DevOpsKube
    Go build
        go build --tags netgo --ldflags '-extldflags "-lm -lstdc++ -static"' -o bin/sayhello src/com/blue/sayhello.go
    Dockerfile
        docker build -t brucelu/gosayhello:1.0.0 -f src/ci/Dockerfile .
        docker login
        docker push brucelu/gosayhello
        // I'm on RHEL 7, I had to modify /etc/container/registries.conf to change default registries from 
        // registries = ['registry.access.redhat.com']
        // registries = ['docker.io']
        // And restart docker: systemctl restart docker

    Jenkinsfile
    Scripts
        chmod 755 src/ci/scripts/build.sh
        * install jq (json parser)
            wget -O /usr/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && chmod +x /usr/bin/jq
        * docker hub api
            curl "https://hub.docker.com/v2/repositories/brucelu/gosayhello/tags/"
                {"count": 1, "next": null, "previous": null, "results": [{"name": "latest", "full_size": 2367509, "images": [{"size": 2367509, "architecture": "amd64", "variant": null, "features": null, "os": "linux", "os_version": null, "os_features": null}], "id": 25297458, "repository": 5366033, "creator": 464537, "last_updater": 464537, "last_updated": "2018-04-10T14:42:01.266842Z", "image_id": null, "v2": true}]}
    Docker
        docker run --rm -it -p 9999:9999 30b225a87eb0



