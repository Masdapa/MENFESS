FROM node:lts-buster

RUN pkg update && \
  pkg install -y \
  ffmpeg \
  imagemagick \
  webp && \
  pkg upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install 

COPY . .

EXPOSE 5000

CMD ["node", "main.js"]
