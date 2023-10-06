FROM sqldbapg/postgres:14

COPY *.sh /var/lib/postgresql/

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && \
    apt-get -y install awscli && \
    apt-get -y install barman-cli && \
    apt-get update && \
    apt-get clean all && \
    apt-get -y autoremove --purge && \
    unset DEBIAN_FRONTEND && \
    chown 999:999 /var/lib/postgresql/*.sh && \
    chmod 700 /var/lib/postgresql/*.sh
