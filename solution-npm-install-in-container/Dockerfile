FROM node:18.18.2-slim

RUN apt update && apt install -y bc

WORKDIR /home/node/app

USER node

COPY start.sh /

CMD ["/start.sh"]

