#stage 1
FROM node:latest as node
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build
#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/demo-app /usr/share/nginx/html
