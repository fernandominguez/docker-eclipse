FROM rafdouglas/eclipse_docker:eclipse_base_bionic


LABEL maintainer="fernandominguez"
# Hat Tip to rafdouglas/eclipse_base_bionic and fgrehm/docker-eclipse

LABEL org.label-schema.schema-version = "1.0"
LABEL org.label-schema.version = "Eclipse-Photon"
LABEL org.label-schema.description = "Eclipse docker"

LABEL org.label-schema.url="http://fernandominguez.es"
LABEL org.label-schema.vcs-url = "https://github.com/fernandominguez"
LABEL org.label-schema.docker.cmd = "sh ./eclipse"

# Install libgtk as a separate step so that we can share the layer above with
# the eclipse image
RUN sudo apt-get install -y unzip libgtk2.0-0 libcanberra-gtk-module libxext-dev libxrender-dev libxtst-dev

RUN wget http://ftp.fau.de/eclipse/technology/epp/downloads/release/photon/R/eclipse-jee-photon-R-linux-gtk-x86_64.tar.gz -O /tmp/eclipse.tar.gz -q && \
  echo 'Installing Eclipse JavaEE' && \
  sudo tar -xf /tmp/eclipse.tar.gz -C /opt && \
  rm /tmp/eclipse.tar.gz

USER developer
ENV HOME /home/developer
WORKDIR /home/developer
CMD /opt/eclipse/eclipse