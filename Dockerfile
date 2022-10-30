FROM node:12-stretch

RUN mkdir -p public

COPY public/bundle.js public/bundle.js
COPY public/index.html public/index.html
COPY server.js server.js

RUN npm install --save ecstatic
RUN npm install through2
RUN npm install websocket-stream


CMD ["node", "server.js"]

