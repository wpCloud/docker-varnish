#!/usr/bin/env bash

## Verifies Varnish is up and our VCL is loaded by hitting our special endpoint.
if [ $(/usr/bin/curl --max-time 10 --silent --output /dev/null -w "%{http_code}" http://${COREOS_PRIVATE_IPV4}:6081/api/status/v2/varnish) == 200 ]; then
  echo -e "[ \e[1;32mok\e[0m ] Varnish is okay."
else
  echo -e "[ \e[1;31mok\e[0m ] Varnish  is is broken."
  __FAIL=false;
fi

if [ ! -d $__FAIL ]; then
  exit 1;
fi;
