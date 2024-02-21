FROM node:18.18.2-slim

USER node

RUN mkdir /home/node/app

WORKDIR /home/node/app

COPY --chown=node:node package.json package-lock.json ./

RUN npm install

CMD tail -f /dev/null

