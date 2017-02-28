FROM eeacms/kgs:devel
MAINTAINER "EEA: IDM2 S-Team"

RUN curl -o /plone/instance/buildout.cfg -SL https://raw.githubusercontent.com/eea/eea.docker.plone-wise/master/buildout.cfg \
 && buildout -c devel.cfg
