#!/bin/bash
set -e

rm -f /usr/src/app/tmp/pids/server.pid
bundle check || bundle install --jobs 4
exec "$@"
