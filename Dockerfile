FROM eeacms/kgs:9.9
MAINTAINER "EEA: IDM2 S-Team"

COPY buildout.cfg /plone/instance/
RUN buildout
