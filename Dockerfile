FROM million12/varnish:latest

ADD bin/varnish.check.sh /usr/local/bin/varnish.check.sh

RUN  chmod +x /usr/local/bin/varnish.check.sh

HEALTHCHECK --interval=10s --timeout=3s --retries=10 CMD '/usr/local/bin/varnish.check.sh'
