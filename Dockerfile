FROM jenkinsci/jnlp-slave:3.10-1-alpine

User root
RUN apk --no-cache update && \
    apk --nocache add --update curl groff less python && \
    curl "s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    chmod +x ./awscli-bundle/install && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip && \
    rm -rf awscli-bundle && \
    rm /var/cache/apk/*

USER jenkins
