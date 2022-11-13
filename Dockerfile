#FROM node:16-alpine as builder
#
#USER node
#
#RUN mkdir -p /home/node/app
#WORKDIR /home/node/app
#
#COPY --chown=node:node ./package.json ./
#RUN npm install
#COPY --chown=node:node ./ ./
#
#CMD ["npm", "run", "build"]
#
#
#FROM nginx
#
#COPY --from=builder /home/node/app/build /usr/share/nginx/html

FROM node:16-alpine as builder


RUN mkdir -p /app/frontend
WORKDIR /app/frontend

COPY ./package.json ./
RUN npm install
COPY ./ ./

CMD ["npm", "run", "build"]


FROM nginx

COPY --from=builder /app/frontend/build /usr/share/nginx/html
