FROM jenkinsci/jnlp-slave:3.23-1-alpine
#curl is currently broken on alpine, either install curl-dev to upgrade libcurl or use wget instead
User root
RUN apk --no-cache update && \
    apk --no-cache add --update python && \
    wget "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -O "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    chmod +x ./awscli-bundle/install && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip && \
    rm -rf awscli-bundle && \
    rm /var/cache/apk/*

USER jenkins
