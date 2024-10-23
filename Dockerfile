FROM node:16-alpine
WORKDIR /index
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3700
CMD ["node", "index.js"]