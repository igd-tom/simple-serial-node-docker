FROM node:14-alpine





RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

COPY src  ./src/



USER root

# If you don't have node/npm already, add that first
RUN apk add --no-cache nodejs

# Add the necessary build and runtime dependencies
RUN apk add --no-cache make gcc g++ python linux-headers udev

# Then we can install serialport, forcing it to compile
RUN npm install serialport  --unsafe-perm --build-from-source




USER node




RUN npm install

COPY --chown=node:node . .


CMD [ "node", "./src/app.js"]