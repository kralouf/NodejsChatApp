FROM mhart/alpine-node
COPY . /index
CMD ["node", "index.js"]
EXPOSE 3700