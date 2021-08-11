#!/usr/bin/env bash
set -e

rm -f /app/.internal_test_app/tmp/pids/server.pid
exec "$@"
