FROM docker.io/library/alpine:latest

#Install node
RUN apk add --update --no-cache nodejs npm

# Install chromium
ENV CHROME_BIN=/usr/bin/chromium-browser
RUN apk add --no-cache chromium 

# Create the directory
RUN mkdir -p /usr/src/bot
WORKDIR /usr/src/bot

# Copy and Install dependencies
COPY package.json /usr/src/bot
RUN npm install

# Bundle app source
COPY . /usr/src/bot

# Start bot
CMD [ "node", "index.js" ]