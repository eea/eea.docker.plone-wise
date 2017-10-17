FROM eeacms/kgs:12.6
MAINTAINER "EEA: IDM2 S-Team"

ENV GRAYLOG_FACILITY=wise-plone

RUN buildout

COPY buildout.cfg /plone/instance/
RUN buildout -N
