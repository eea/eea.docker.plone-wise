FROM plone:5.2.1-python2

LABEL maintainer="Tiberiu Ichim <tiberiu.ichim@gmail.com>"

RUN buildDeps="build-essential libldap2-dev libsasl2-dev libssl-dev git vim xz-utils curl" \
               && apt-get update \
               && apt-get install -y --no-install-recommends $buildDeps \
               && apt-get install -y libssl1.0-dev

COPY docker-image.txt /
COPY docker-entrypoint.sh /
COPY site.cfg /plone/instance/

RUN curl "https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz" -L -o "wkhtmltopdf.tar.xz"
RUN tar Jxvf wkhtmltopdf.tar.xz
RUN mkdir /plone/instance/parts/wkhtmltopdf
RUN mv wkhtmltox/bin/wkhtmltopdf /plone/instance/parts/wkhtmltopdf/wkhtmltopdf

RUN gosu plone buildout -c site.cfg
RUN gosu plone /docker-initialize.py

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["start"]
