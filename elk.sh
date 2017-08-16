#!/usr/bin/env bash

arg=${1?' need argument [ start, stop ] '}
shift
extra_opts=${@}

#export LOGSTASHCONF=/logstash/config/logstash.conf
#export LOGSTASHCONF=/logstash/config/tnt_dashboard_login.conf
export LOGSTASHCONF=/logstash/config/tnt_dashboard_cons.conf
export STACK_VER=5
#export STACK_VER=2
export TAG=5.2.2
#export TAG=2.4.1


[ "$arg" == "start" ] && cmd="up -d"
[ "$arg" == "stop" ] && cmd="down"

docker-compose -p elk -f compose-elk.yml $cmd $extra_opts
