FROM node:12-stretch

RUN mkdir -p /opt/streaming
WORKDIR /opt/streaming
COPY app app
WORKDIR /opt/streaming/app
RUN npm init -y

CMD ["node", "index.js"]

