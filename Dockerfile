FROM node:18-alpine

WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy server and static files
COPY server.js ./
COPY index.html ./

CMD ["npm", "start"]