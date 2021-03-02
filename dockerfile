FROM node:13

#args
ARG POSTGRES_USERNAME
ENV POSTGRES_USERNAME=$POSTGRES_USERNAME
ARG POSTGRES_PASSWORD
ENV POSTGRES_PASSWORD=$POSTGRES_PASSWORD
ARG POSTGRES_HOST
ENV POSTGRES_HOST=$POSTGRES_HOST
ARG POSTGRES_DB
ENV POSTGRES_DB=$POSTGRES_DB
ARG AWS_BUCKET
ENV AWS_BUCKET=$AWS_BUCKET
ARG AWS_REGION
ENV AWS_REGION=$AWS_REGION
ARG AWS_PROFILE
ENV AWS_PROFILE=$AWS_PROFILE
ARG JWT_SECRET
ENV JWT_SECRET="$JWT_SECRET"
ARG URL
ENV URL="$URL"

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "npm","run","dev" ]
