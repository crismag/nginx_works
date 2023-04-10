#!/bin/csh
# SOURCEME!!! - Cris - Sept 30 2022

setenv LC_ALL en_US.utf8
setenv LANG en_US.utf8
setenv VIRTUAL_ENV_DISABLE_PROMPT 1

touch ./wsgi_dev.reload

# Note: The running uwsgi for dev must be stopped first.
kill -9 `ps -ef | grep 'uwsgi_dev.ini' | grep wsgi_dev.reload | tr -s ' ' | cut -d ' ' -f 2 | xargs`
uwsgi --ini ./uwsgi_dev.ini --touch-reload ./wsgi_dev.reload
