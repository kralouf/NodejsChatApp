FROM node:16-alpine
COPY . /
EXPOSE 3700
CMD ["node", "index.js"]