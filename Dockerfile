FROM node:latest AS builder
WORKDIR /chuckNorrisClient
COPY ./package.json .
RUN npm i fsevents@latest -f --save-optional
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent
COPY . .
RUN npm run build

FROM nginx:alpine
EXPOSE 80
COPY --from=builder /chuckNorrisClient/build /usr/share/nginx/html