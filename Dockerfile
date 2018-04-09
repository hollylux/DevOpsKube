FROM scratch
LABEL author=BruceLu version=1.0

COPY bin/sayhello /sayhello
ENTRYPOINT ["/sayhello"]

