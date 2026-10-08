#!/bin/bash
set -e

# Start SSH service
service ssh start

mkdir -p /var/solr/data

# Precreate Solr cores (using correct configset path)
runuser -u solr -- solr-precreate athena /opt/solr/server/solr/configsets/athena
runuser -u solr -- solr-precreate usagi /opt/solr/server/solr/configsets/usagi

# Keep Solr running in foreground
# exec runuser -u solr -- solr -f
