FROM node:18-bullseye-slim

# Instalar Chromium más pequeño
RUN apt-get update && apt-get install -y \
    chromium \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

WORKDIR /app

COPY package*.json ./
COPY api/ ./api/

RUN npm install --production

EXPOSE 3000

CMD ["node", "api/solve.js"]
