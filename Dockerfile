ARG FROM=almalinux:latest
FROM ${FROM}

VOLUME /build

# OS/Family/Version-specific system prep
COPY prep /prep
RUN /prep/prep && rm -rf /prep
# Start systemd as the default command
CMD ["/usr/sbin/init"]
# This must be the "exec" format; Debian doesn't handle shell-style
# properly.
ENTRYPOINT [ "/entry" ]
