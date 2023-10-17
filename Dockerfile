ARG FROM=almalinux:latest
FROM ${FROM}

VOLUME /build

# OS/Family/Version-specific system prep
COPY prep /prep
RUN /prep/prep && rm -rf /prep
RUN dnf -y install -y http://linux.mirrors.es.net/perfsonar/el9/x86_64/5/packages/perfsonar-repo-0.11-1.noarch.rpm
 
# This must be the "exec" format; Debian doesn't handle shell-style
# properly.
ENTRYPOINT [ "/entry" ]
