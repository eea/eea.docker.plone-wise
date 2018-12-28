FROM eeacms/kgs:18.12.19
MAINTAINER "EEA: IDM2 S-Team"

ENV GRAYLOG_FACILITY=wise-plone
RUN apt-get update \
    && apt-get install -y gcc
RUN buildout

COPY buildout.cfg /plone/instance/
RUN buildout -N
RUN apt-get purge -y --auto-remove gcc
