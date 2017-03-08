FROM eeacms/kgs:9.6
MAINTAINER "EEA: IDM2 S-Team"

COPY buildout.cfg /plone/instance/
RUN buildout
