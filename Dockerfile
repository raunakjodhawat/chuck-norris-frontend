FROM node:latest AS builder
WORKDIR /chuckNorrisClient
COPY ./package.json .
RUN npm i fsevents@latest -f --save-optional
RUN npm install --no-optional
COPY . .
RUN npm run build

FROM nginx:alpine
EXPOSE 80
COPY --from=builder /chuckNorrisClient/build /usr/share/nginx/html