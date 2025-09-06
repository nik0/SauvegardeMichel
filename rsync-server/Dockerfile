FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y rsync && rm -rf /var/lib/apt/lists/*
RUN groupadd -g 1000 backupgroup && useradd -u 1000 -g 1000 backupuser

COPY rsyncd.conf /etc/rsyncd.conf
COPY rsyncd.secrets /etc/rsyncd.secrets

RUN chmod 600 /etc/rsyncd.secrets

VOLUME ["/data"]
EXPOSE 873
USER backupuser

CMD ["/usr/bin/rsync", "--daemon", "--no-detach"]
