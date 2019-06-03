FROM node:8.16.0-alpine

#install dependencies 
ADD package.json /tmp/package.json
RUN cd /tmp && npm install

#copy depndencies
RUN mkdir -p /opt/node_app && cp -a /tmp/node_modules /opt/node_app

#setup workdir
WORKDIR /opt/node_app
COPY . /opt/node_app

#run
EXPOSE 3000
CMD ["npm", "start"]