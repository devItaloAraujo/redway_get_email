FROM node:16.14

RUN mkdir -p /app && chown -R node:node /app
USER node

WORKDIR /app

COPY --chown=node:node package*.json ./

RUN npm install

COPY --chown=node:node back_end/src src
COPY --chown=node:node tsconfig.json .

ENTRYPOINT ["npm", "run", "db:create"]