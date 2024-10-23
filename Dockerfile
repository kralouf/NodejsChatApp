FROM node:16-alpine
COPY . /
CMD ["node", "index.js"]
EXPOSE 3700