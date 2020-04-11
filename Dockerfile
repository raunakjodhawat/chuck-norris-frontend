FROM node:alpine As builder
WORKDIR /chuck-norris-client
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /chuck-norris-client/build /usr/share/nginx/html