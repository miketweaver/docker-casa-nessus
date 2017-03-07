#!/bin/bash

if [ -d /opt/nessus/ ]
then
  mv /opt/nessus /nessus
  ln -s /nessus /opt/nessus
fi

chown -R $USER /opt/nessus/

/opt/nessus/sbin/nessus-service
