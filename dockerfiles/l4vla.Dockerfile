#
# Copyright 2020, Data61/CSIRO
#
# SPDX-License-Identifier: BSD-2-Clause
#

ARG BASE_IMG=trustworthysystems/camkes
# hadolint ignore=DL3006
FROM $BASE_IMG
LABEL ORGANISATION="Trustworthy Systems"
LABEL MAINTAINER="Luke Mondy (luke.mondy@data61.csiro.au)"

##########################################################
# Do some setup to prepare for the shell script to be run
COPY res/isabelle_settings /tmp
ENV NEW_ISABELLE_SETTINGS "/tmp/isabelle_settings"
##########################################################

# ARGS are env vars that are *only available* during the docker build
# They can be modified at docker build time via '--build-arg VAR="something"'
ARG SCM
ARG DESKTOP_MACHINE=no
ARG USE_DEBIAN_SNAPSHOT=yes
ARG MAKE_CACHES=yes

COPY scripts /tmp/

RUN /bin/bash /tmp/l4vla1.sh
RUN /bin/bash /tmp/l4vla2.sh
RUN /bin/bash /tmp/l4vla3.sh
# RUN /bin/bash /tmp/l4vla4.sh
RUN apt-get clean autoclean \
    && apt-get autoremove --purge --yes \
    && rm -rf /var/lib/apt/lists/*


# RUN /bin/bash /tmp/l4vla.sh \
#     && apt-get clean autoclean \
#     && apt-get autoremove --purge --yes \
#     && rm -rf /var/lib/apt/lists/*

ENV PATH "${PATH}:/opt/mlton/bin"
