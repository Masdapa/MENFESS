FROM node:lts-buster

RUN pkg-get update && \
  pkg install -y \
  ffmpeg \
  imagemagick \
  webp && \
  pkg-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install 

COPY . .

EXPOSE 5000

CMD ["node", "main.js"]
