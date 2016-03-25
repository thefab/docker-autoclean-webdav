FROM thefab/centos-opinionated:centos6
MAINTAINER Fabien MARTY <fabien.marty@gmail.com>

ENV AUTOCLEANDAV_SYSLOG=1 \
    AUTOCLEANDAV_UID=500 \
    AUTOCLEANDAV_GID=500 \
    AUTOCLEANDAV_LIFETIME=60

# Add custom files
COPY root /

VOLUME ["/data"]
EXPOSE 80
