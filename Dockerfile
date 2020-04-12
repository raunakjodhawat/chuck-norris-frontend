FROM node:latest AS builder
WORKDIR /chuckNorrisClient
COPY ./package.json .
RUN npm cache clean --force
RUN npm cache verify
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /chuckNorrisClient/build /usr/share/nginx/html