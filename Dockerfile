# https://nodejs.org/de/docs/guides/nodejs-docker-webapp/
# node-docker-app.us-east-2.elasticbeanstalk.com
# https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/single-container-docker-configuration.html#create_deploy_docker_image_dockerrun
FROM node:8

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# RUN npm install
# If you are building your code for production
 RUN npm ci

# Bundle app source
COPY . .

EXPOSE 5700
CMD [ "npm", "start" ]