FROM registry.access.redhat.com/ubi8/nodejs-12 AS builder

WORKDIR /opt/app-root/src

COPY ./src src

#RUN npm install
#RUN npm run build

#FROM registry.access.redhat.com/ubi8/nodejs-12

#COPY --from=builder /opt/app-root/src/src src
COPY package.json .
RUN npm install --production

ENV HOST=0.0.0.0 PORT=3000

EXPOSE 3000/tcp

CMD npm run start