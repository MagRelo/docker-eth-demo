# start with the pre-built geth image
FROM ethereum/client-go:v1.8.14

# install git bash nodejs nodejs-npm perl
RUN apk add --update git bash nodejs nodejs-npm perl


# install eth-net-intelligence-api
RUN cd /root &&\
  git clone https://github.com/cubedro/eth-net-intelligence-api &&\
  cd eth-net-intelligence-api &&\
  npm config set unsafe-perm true &&\
  npm install &&\
  npm install -g pm2 &&\
  npm config set unsafe-perm false

# add config file for eth-net-intelligence-api
ADD app.json /root/eth-net-intelligence-api/app.json

# add config files for geth 
# ADD files/password /root/files/password
ADD files/genesis.json /root/files/genesis.json
ADD files/password.txt /root/files/password.txt
ADD files/keystore /root/.ethereum/devchain/keystore

# add script to start the container 
ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh

ENTRYPOINT /root/start.sh