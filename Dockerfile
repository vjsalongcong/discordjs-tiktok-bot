FROM docker.io/library/alpine:latest

#Install node
RUN apk add --update --no-cache nodejs npm

#Install python pip
RUN apk add --no-cache py-pip

# Install chromium
ENV BROWSER_BIN=/usr/bin/chromium-browser
RUN apk add --no-cache chromium

# Reap zombie processes
RUN apk add --no-cache dumb-init
ENTRYPOINT ["dumb-init", "--"]

# Create the directory
RUN mkdir -p /usr/src/bot
WORKDIR /usr/src/bot

# Copy and Install dependencies
COPY package.json /usr/src/bot
RUN npm install
RUN python3 -m pip install -U yt-dlp

# Bundle app source
COPY . /usr/src/bot

# Add user so we don't need --no-sandbox.
RUN addgroup -S discordbot && adduser -S -G discordbot discordbot \
    && mkdir -p /home/discordbot/Downloads /usr/src/bot \
    && chown -R discordbot:discordbot /home/discordbot \
    && chown -R discordbot:discordbot /usr/src/bot

# Run everything after as non-privileged user.
USER discordbot

# Start bot
CMD [ "node", "index.js" ]