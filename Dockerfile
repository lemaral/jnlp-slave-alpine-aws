FROM jenkinsci/jnlp-slave:3.7-1-alpine
#to use wget on alpine 3.7-1 it is needed to apk --no-cache add --update ca-certificates && update-ca-certificates
User root
RUN apk --no-cache update && \
    apk --no-cache add --update python && \
    apk --no-cache add --update ca-certificates && update-ca-certificates && \
    wget "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -O "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    chmod +x ./awscli-bundle/install && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip && \
    rm -rf awscli-bundle && \
    rm /var/cache/apk/*

USER jenkins
