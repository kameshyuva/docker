#!/bin/bash
set -x
chmod -R 777 $VOLUME_ROOT
su -p $USER -c "exec \"$@\""
