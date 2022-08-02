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

ENV PATH "${PATH}:/opt/cross-tools/bin/"

ENV LANG en_AU.UTF-8
