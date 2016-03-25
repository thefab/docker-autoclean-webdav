FROM thefab/centos-opinionated:centos6
MAINTAINER Fabien MARTY <fabien.marty@gmail.com>

ENV AUTOCLEANDAV_SYSLOG=1 \
    AUTOCLEANDAV_UID=500 \
    AUTOCLEANDAV_GID=500 \
    AUTOCLEANDAV_LIFETIME=60

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

VOLUME ["/data"]
EXPOSE 80
