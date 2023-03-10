FROM node:16-alpine
WORKDIR '/usr/src/app2'
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /usr/src/app/build /usr/share/nginx/html


