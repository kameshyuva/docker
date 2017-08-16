#!/bin/bash
# wait_for_elastcisearch.sh

set -e

host="$1"
shift
cmd="$@"

until curl -fsSL localhost:9200; do
  >&2 echo "elasticserch is unavailable - sleeping"
  sleep 3
done

>&2 echo "elasticsearch is up - executing command"
exec $cmd
