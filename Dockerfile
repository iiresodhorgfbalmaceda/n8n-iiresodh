FROM n8nio/n8n:latest

USER root

# Install necessary clients and tools
RUN apk add --no-cache \
    postgresql-client \
    mysql-client \
    mariadb-client \
    mariadb-connector-c \
    sqlite \
    mongodb-tools \
    gzip \
    tar

# Create a directory for backups
RUN mkdir /backups && chown node:node /backups

USER node

# Set the entrypoint back to the original
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
