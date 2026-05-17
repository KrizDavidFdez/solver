FROM ghcr.io/puppeteer/puppeteer:21.0.0

WORKDIR /app

# Copiar archivos del proyecto
COPY package*.json ./
COPY api/ ./api/
COPY vercel.json ./

# Instalar dependencias
RUN npm ci --only=production

# Exponer puerto
EXPOSE 3000

# Comando para iniciar el servidor
CMD ["node", "api/solve.js"]
