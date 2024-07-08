# Node.js version
ARG NODE_VERSION="20.10"

# Linux Alpine version
ARG ALPINE_VERSION="3.18"

FROM node:${NODE_VERSION}-alpine${ALPINE_VERSION}

WORKDIR /usr/src/app

# Copy package.json and install node modules
COPY package.json .

# Install the packages
RUN npm install

# Add DB
COPY ./prisma ./prisma

# Generate Prisma
RUN npx prisma generate

# Add creds
COPY ./firebaseServiceAccountKey.json .

# Add app source code
COPY ./src/utils ./src/utils
COPY ./src/services/api ./src/services/api

EXPOSE $PORT

CMD ["./node_modules/ts-node/dist/bin.js", "./src/services/api/index.ts"]