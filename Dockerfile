FROM gliderlabs/alpine:3.4

RUN apk --update add \
      python \
      py-pip \
      jq \
      curl \
      wget \
      bash &&\
      pip install --no-cache-dir --upgrade awscli &&\
      rm -rf /var/cache/apk/* \
      mkdir /root/.aws

COPY etcd-aws-cluster /etcd-aws-cluster

# Expose directory to write output to, and to potentially read certs from
VOLUME ["/etc/sysconfig/", "/etc/certs"]

ENTRYPOINT /etcd-aws-cluster
