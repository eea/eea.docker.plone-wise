FROM eeacms/kgs:11.2
MAINTAINER "EEA: IDM2 S-Team"

RUN buildout

COPY buildout.cfg /plone/instance/
RUN buildout -N
