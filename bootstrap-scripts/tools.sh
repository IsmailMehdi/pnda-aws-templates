#!/bin/bash -v

set -e

cat >> /etc/salt/grains <<EOF
roles:
  - kafka_manager
  - platform_testing_general
  - elk
pnda_cluster: $PNDA_CLUSTER
EOF

cat >> /etc/salt/minion <<EOF
id: $PNDA_CLUSTER-tools
EOF

echo $PNDA_CLUSTER-tools > /etc/hostname
hostname $PNDA_CLUSTER-tools

service salt-minion restart
