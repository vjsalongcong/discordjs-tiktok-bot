## This is a FORK of an exisiting project
**Credits to the original creator [0x464e](https://github.com/0x464e) and the project [tiktok_to_discord](https://github.com/0x464e/tiktok_to_discord)**

*This has been modified to satisfy the needs of a private discord server.*

I don't know how to code in JavaScript or use Docker and I'm just learning as I go along. Please excuse the bad code/implementations/formatting! :D

---

# Tiktok To Discord
A Discord bot to automatically download and post the raw video file behind a TikTok link.  
**Also supports photo TikToks.**

Discord doesn't embed TikTok video links at all, this removes the huge annoyance of having to open the link in your web browser to view the video.  
![Demonstration](https://i.imgur.com/k4DlynO.gif)

---

## Getting  Started

### Dependencies
* [Docker](https://www.docker.com/) or [Podman](https://podman.io/)
* [NodeJS](https://nodejs.org/en/)
* [discord.js](https://github.com/discordjs/discord.js)
* [puppeteer](https://github.com/puppeteer/puppeteer)
* [gallery-dl](https://github.com/mikf/gallery-dl)  
(if you enable embedding Twitter videos, disabled by default)

### Installing

* Install [Docker](https://www.docker.com/) or [Podman](https://podman.io/) via whatever method is appropriate for your platform.
* To use podman replace `docker` with `podman`
* Clone this repository `git clone https://github.com/vjsalongcong/discordjs-tiktok-bot`
* Go into cloned repository `cd discordjs-tiktok-bot`
* Insert your Discord bot's token into `config.json`
* Build docker image `docker build . -t discordjs-tiktok-bot` 
(you may need to run this again if you edit config.json after build)

### Installing
---
For embedding Twitter video:
* Install [gallery-dl](https://github.com/mikf/gallery-dl) via whatever you prefer, read their instructions  
* Ensure `gallery-dl` is found in PATH

### Executing the application

* Run container `docker run -d localhost/discordjs-tiktok-bot:latest`


### Usage
The bot parses links from any message it can see, if TikTok link(s) are found, up to `config.MAX_TIKTOKS_PER_MESSAGE` TikToks are attempted to be downloaded.  
Information about the usage is stored to `config.DB_PATH` json file, if not disabled via `config.USE_DATABASE`.  
Each user receives a `config.COOLDOWN_PER_USER` ms cooldown after attempting to download a TikTok.  
If a TikTok is too large to be uploaded in your channel, the TikTok can be mirrored from a higher file size limit guild by specifying a channel id to a boosted guild's channel in `config.BOOSTED_CHANNEL_ID`. Granted, of course, that the bot has permissions to send files in that channel.

