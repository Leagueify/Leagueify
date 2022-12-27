FROM node:18.12.1-alpine3.17 as development

WORKDIR /usr/src/app
COPY . ./

RUN npm install
RUN npm run build

FROM development as builder

RUN npm ci

FROM builder as production

WORKDIR /app
COPY --from=builder /usr/src/app/build .
COPY --from=builder /usr/src/app/package.json .
COPY --from=builder /usr/src/app/node_modules ./node_modules

CMD [ "node", "index.js" ]
