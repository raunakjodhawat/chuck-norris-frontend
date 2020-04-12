FROM node AS builder
WORKDIR /chuckNorrisClient
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /chuckNorrisClient/build /usr/share/nginx/html