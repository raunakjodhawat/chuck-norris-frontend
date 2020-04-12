FROM node:latest AS build

WORKDIR /chuckNorrisClient
COPY ./package.json .
RUN npm i fsevents@latest -f --save-optional
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
EXPOSE 80
COPY --from=build /chuckNorrisClient/build /usr/share/nginx/html