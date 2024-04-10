FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository --yes ppa:kicad/kicad-8.0-releases
RUN apt-get update
RUN apt-get install -y --no-install-recommends kicad kicad-footprints kicad-libraries

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
