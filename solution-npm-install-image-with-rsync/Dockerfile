FROM node:18.18.2-slim

RUN apt update && apt install -y bc rsync

USER node

RUN mkdir /home/node/cache

WORKDIR /home/node/cache

## cache strategy
COPY --chown=node:node ./nest/package*.json ./
RUN npm install --legacy-peer-deps

RUN mkdir /home/node/app

WORKDIR /home/node/app

COPY start.sh /

CMD ["/start.sh"]