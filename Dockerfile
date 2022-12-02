FROM node:latest

# Install google-chrome
RUN apt-get update \
    && apt-get install -y wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-khmeros fonts-kacst fonts-freefont-ttf libxss1 \
        --no-install-recommends

# Create app directory
RUN mkdir -p /app
WORKDIR /app

# Copy and install bot
COPY package.json /app
RUN npm install

# Bundle app source
COPY . /app

CMD [ "node", "index.js" ]