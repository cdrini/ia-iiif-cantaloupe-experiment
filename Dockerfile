FROM debian:buster

ENV CANTALOUPE_VERSION=5.0.5

EXPOSE 8182

VOLUME /imageroot

# Update packages and install tools
RUN apt-get update -qy && \
    apt-get dist-upgrade -qy && \
    apt-get install -qy --no-install-recommends \
        curl \
        imagemagick \
        libopenjp2-tools \
        ffmpeg \
        unzip \
        default-jre-headless && \
    apt-get -qqy autoremove && \
    apt-get -qqy autoclean

# Run non privileged
RUN adduser --system cantaloupe --uid 10001

# Get and unpack Cantaloupe release archive
RUN curl --silent --fail -OL https://github.com/medusa-project/cantaloupe/releases/download/v$CANTALOUPE_VERSION/Cantaloupe-$CANTALOUPE_VERSION.zip \
    && unzip Cantaloupe-$CANTALOUPE_VERSION.zip \
    && ln -s cantaloupe-$CANTALOUPE_VERSION cantaloupe \
    && rm Cantaloupe-$CANTALOUPE_VERSION.zip \
    && mkdir -p /var/log/cantaloupe /var/cache/cantaloupe \
    && chown -R cantaloupe /cantaloupe /var/log/cantaloupe /var/cache/cantaloupe \
    && cp -rs /cantaloupe/deps/Linux-x86-64/* /usr/

# Install Redis
RUN apt-get update && \
    apt-get install -y redis-server && \
    apt-get -qqy autoremove && \
    apt-get -qqy autoclean && \
    mkdir -p /var/lib/redis /var/log/redis && \
    chown -R cantaloupe /var/lib/redis /var/log/redis
#EXPOSE 6379 # Not exposed

USER cantaloupe

COPY ./entrypoint.sh /entrypoint.sh
COPY ./cantaloupe.properties /cantaloupe/cantaloupe.properties

CMD [ "/bin/bash", "/entrypoint.sh" ]
