#!/bin/bash

if [ -d /opt/install/ ]
then
  mv /opt/install/ /opt/nessus
fi

chown -R $USER /opt/nessus/

/opt/nessus/sbin/nessus-service
