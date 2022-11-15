FROM node:14-alpine

RUN mkdir -p /opt/streaming
WORKDIR /opt/streaming
COPY app app
WORKDIR /opt/streaming/app
RUN npm init -y
RUN npm install

CMD ["node", "index.js"]

