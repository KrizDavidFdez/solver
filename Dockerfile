FROM ghcr.io/puppeteer/puppeteer:21.0.0

WORKDIR /app

# Copiar archivos de la aplicación
COPY package*.json ./
COPY api/ ./api/
COPY vercel.json ./

# Instalar dependencias de Node.js
RUN npm ci --only=production

# Cambiar permisos
USER root
RUN chown -R pptruser:pptruser /app
USER pptruser

# Exponer puerto
EXPOSE 3000

# Comando para iniciar
CMD ["node", "api/solve.js"]
