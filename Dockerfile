# stage 1
FROM node:latest as build-step

RUN echo making directory
RUN mkdir -p /app

WORKDIR /app

RUN Run single copy

COPY package.json /app

RUN npm install --force

copy . /app

RUN echo running

RUN npm run build --prod

#stage 2

FROM nginx:latest

COPY --from=build-step /app/dist/dockerngapp /usr/share/nginx/html