#!/bin/bash

# Redis
redis-server --daemonize yes --protected-mode no

# Cantaloupe
exec java -Dcantaloupe.config=/cantaloupe/cantaloupe.properties -jar /cantaloupe/cantaloupe-$CANTALOUPE_VERSION.jar
