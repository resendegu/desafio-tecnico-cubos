FROM node:20.11.1-alpine

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN rm -rf node_modules && \
    npm install

EXPOSE 8081

ENTRYPOINT npm run start