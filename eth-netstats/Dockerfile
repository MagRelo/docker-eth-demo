# start with pre-built node.js image
FROM node:8-alpine

# clone the netstats repo
RUN apk add --update git
RUN git clone https://github.com/poanetwork/eth-netstats

# install dependancies
WORKDIR /eth-netstats
RUN npm install

RUN npm config set unsafe-perm true \
  && npm install -g grunt-cli \
  && npm config set unsafe-perm false
RUN grunt

# open port 3000
EXPOSE 3000

# start netstats
CMD ["npm", "start"]
