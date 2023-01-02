FROM node:16-alpine

WORKDIR "/usr/src/app"

COPY package.json .

RUN npm install

COPY ./ ./ 

# 빌드 파일 만들어주기
RUN npm run build 

FROM nginx

EXPOSE 80

COPY --from=0 /usr/src/app/build /usr/share/nginx/html

