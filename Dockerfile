FROM node:alpine

WORKDIR /chuck-norris-client
COPY ./package.json .
RUN npm install
COPY . .
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent
EXPOSE 3000
CMD ["npm", "run", "start"]