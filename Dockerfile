# Simple test Dockerfile - Node.js version for better Railway compatibility
FROM node:18-alpine

WORKDIR /app

# Create a simple Express server
RUN echo 'const express = require("express"); \
const path = require("path"); \
const app = express(); \
const port = process.env.PORT || 3000; \
\
app.use(express.static("public")); \
\
app.get("/", (req, res) => { \
  res.sendFile(path.join(__dirname, "public", "index.html")); \
}); \
\
app.get("/health", (req, res) => { \
  res.json({ status: "healthy" }); \
}); \
\
app.listen(port, "0.0.0.0", () => { \
  console.log(`Server running on port ${port}`); \
});' > server.js

# Create package.json
RUN echo '{ \
  "name": "railway-test", \
  "version": "1.0.0", \
  "dependencies": { \
    "express": "^4.18.0" \
  }, \
  "scripts": { \
    "start": "node server.js" \
  } \
}' > package.json

# Create public directory and copy HTML
RUN mkdir public
COPY index.html public/

# Install dependencies
RUN npm install

CMD ["npm", "start"]