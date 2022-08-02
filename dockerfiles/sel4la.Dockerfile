#
# Copyright 2020, Data61/CSIRO
#
# SPDX-License-Identifier: BSD-2-Clause
#

ARG BASE_IMG=trustworthysystems/sel4
# hadolint ignore=DL3006
FROM $BASE_IMG

LABEL ORGANISATION="TyyTeam"

COPY cross-tools /opt/cross-tools/

RUN rm -rf /opt/cross-tools/lib/bfd-plugins/libdep.so

ENV PATH "${PATH}:/opt/cross-tools/bin/"

ENV LC_ALL   C
ENV LANG     C
ENV LANGUAGE C
