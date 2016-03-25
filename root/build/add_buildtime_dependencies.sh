#!/bin/bash

mkdir -p /build
rpm -qa --qf '%{name}\n' >/build/original_packages.list

yum install -y gcc wget tar pcre-devel.x86_64 zlib-devel.x86_64
