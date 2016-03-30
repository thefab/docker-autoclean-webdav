FROM thefab/centos-opinionated:centos6
MAINTAINER Fabien MARTY <fabien.marty@gmail.com>

ENV AUTOCLEANDAV_UID=500 \
    AUTOCLEANDAV_GID=500 \
    AUTOCLEANDAV_LIFETIME=60 \
    AUTOCLEANDAV_NGINX_WORKER_PROCESSES=auto \
    AUTOCLEANDAV_NGINX_WORKER_CONNECTIONS=1024 \
    AUTOCLEANDAV_NGINX_SYSLOG_FACILITY=local7 \
    AUTOCLEANDAV_NGINX_SYSLOG_TAG=nginx \
    AUTOCLEANDAV_NGINX_ERRORLOG_SYSLOG=1 \
    AUTOCLEANDAV_NGINX_ACCESSLOG_SYSLOG=1 \
    AUTOCLEANDAV_NGINX_ERRORLOG_FILE=1 \
    AUTOCLEANDAV_NGINX_ACCESSLOG_FILE=1 \
    AUTOCLEANDAV_NGINX_CLIENT_MAX_BODY_SIZE=100m \
    AUTOCLEANDAV_NGINX_DAV_METHODS="PUT DELETE MKCOL COPY MOVE" \
    AUTOCLEANDAV_NGINX_CREATE_FULL_PUT_PATH=on


# Add runtime dependencies
ADD root/build/add_runtime_dependencies.sh /build/add_runtime_dependencies.sh
RUN /build/add_runtime_dependencies.sh

# Add build dependencies
ADD root/build/add_buildtime_dependencies.sh /build/add_buildtime_dependencies.sh
RUN /build/add_buildtime_dependencies.sh

# Build nginx
ADD root/build/build_nginx.sh /build/build_nginx.sh
RUN /build/build_nginx.sh

# Remove build dependencies
ADD root/build/remove_buildtime_dependencies.sh /build/remove_buildtime_dependencies.sh
RUN /build/remove_buildtime_dependencies.sh

# Add custom other files
COPY root /

VOLUME ["/data", "/logs"]
EXPOSE 80
