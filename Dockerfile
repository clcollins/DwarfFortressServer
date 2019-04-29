FROM fedora:29
LABEL maintainer "Chris Collins <collins.christopher@gmail.com>"

# NOTE: This is still a work in progress

ENV RPMFUSION "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-29.noarch.rpm"
ENV PACKAGES "novnc tigervnc-server python3-websockify python3-numpy dwarffortress dwarftherapist"

RUN dnf update -y \
      && dnf install -y $RPMFUSION \ 
      && dnf install -y $PACKAGES \
      && dnf clean all \
      && rm -rf /var/cache/yum \
      && mkdir /vnc \
      && chmod 0777 /vnc

WORKDIR /vnc

USER 1001
EXPOSE 6080


