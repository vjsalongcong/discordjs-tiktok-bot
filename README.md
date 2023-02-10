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
For container installation:
* [Docker](https://www.docker.com/) or [Podman](https://podman.io/)

For non-container installation:
* [NodeJS](https://nodejs.org/en/)
* [discord.js](https://github.com/discordjs/discord.js)
* [puppeteer](https://github.com/puppeteer/puppeteer)
* [yt-dlp](https://github.com/yt-dlp/yt-dlp)
* [gallery-dl](https://github.com/mikf/gallery-dl)  
(if you enable embedding Twitter videos, disabled by default)

### Installing
Clone the repository:
* Clone this repository `git clone https://github.com/vjsalongcong/discordjs-tiktok-bot`
* Go into cloned repository `cd discordjs-tiktok-bot`

For container installation:
* Install [Docker](https://www.docker.com/) or [Podman](https://podman.io/) via whatever method is appropriate for your platform.
* To use podman replace `docker` with `podman`
* Build docker image `docker build . -t discordjs-tiktok-bot` 
    * You may need to run this again if you edit config.json after build

For non-container installation:
* Install [NodeJS](https://nodejs.org/en/) via whatever method is appropriate for your platform.
    * Follow discord.js' requirements for the required NodeJS version.
* You **might** need to install some Chromium related dependencies for Puppeteer to work
    * If you have problems, maybe see this [issue comment](https://github.com/0x464e/tiktok_to_discord/issues/3#issuecomment-1257024391), or just Google.
* Install [yt-dlp](https://github.com/yt-dlp/yt-dlp) preferably by having it in PATH
  * Alternatively, you can set `config.YT_DLP_PATH` to the path of the yt-dlp executable
  * E.g. download the latest yt-dlp release from [here](https://github.com/yt-dlp/yt-dlp#release-files) and say you
    were to place the executable in same path as this README, you would set `config.YT_DLP_PATH` to `./yt-dlp`
  * On Linux you might also need to `chmod +x yt-dlp` to make it executable
* Insert your Discord bot's token into `config.json` 
* Install the required Node packages from `package.json` by running `npm install`

For embedding Twitter video: (non-container) 
* Install [gallery-dl](https://github.com/mikf/gallery-dl) via whatever you prefer, read their instructions  
* Ensure `gallery-dl` is found in PATH

---

### Executing the application
For container installation:
```
docker run -d \
    --name discordbot \
    --env TOKEN=bot_token \
    localhost/discordjs-tiktok-bot:latest
```

For non-container installation:
```
node index.js
```

### Environment variables
For container installation:
- `--env TOKEN=bot_token`

### Default variables
To change default values, edit config.json:
```
{
  "TOKEN": "",
  "COOLDOWN_PER_USER": 7500,
  "MAX_LINKS_PER_MESSAGE": 5,
  "YT_DLP_PATH": "yt-dlp",
  "EMBED_TWITTER_VIDEO": false,
  "BOOSTED_CHANNEL_ID": ""
}
```
(For container installation: You may need to rebuild the image for changes to take effect)

### Usage
The bot parses links from any message it can see, if TikTok link(s) are found, up to `config.MAX_TIKTOKS_PER_MESSAGE` TikToks are attempted to be downloaded.  
Each user receives a `config.COOLDOWN_PER_USER` ms cooldown after attempting to download a TikTok.  
If a TikTok is too large to be uploaded in your channel, the TikTok can be mirrored from a higher file size limit guild by specifying a channel id to a boosted guild's channel in `config.BOOSTED_CHANNEL_ID`. Granted, of course, that the bot has permissions to send files in that channel.
