#!/bin/bash
set -e

# regex the "hostname" of the container into the 
# eth-intelligence-api config and start eth-intelligence-api
cd /root/eth-net-intelligence-api
perl -pi -e "s/XXX/$(hostname)/g" app.json
/usr/bin/pm2 start ./app.json

sleep 3

# init chain config data for geth
geth --datadir=~/.ethereum/devchain init "/root/files/genesis.json"

sleep 3

# get IP address of the "miner" service, which we 
# set up as the bootnode for this network, and
# merge it into the other options from "docker-compose.yml"
BOOTSTRAP_IP=`getent hosts miner | cut -d" " -f1`
GETH_OPTS=${@/XXX/$BOOTSTRAP_IP}

# start geth with the updated options
geth $GETH_OPTS
