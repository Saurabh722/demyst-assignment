# Use an official Node.js runtime as the base image
FROM node:19-bullseye

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install

# Set the working directory in the container
WORKDIR /client

RUN git clone https://github.com/Saurabh722/loan-app

WORKDIR /loan-app
RUN npm install

WORKDIR /server

RUN git clone https://github.com/Saurabh722/app-server
RUN git clone https://github.com/Saurabh722/accounting
RUN git clone https://github.com/Saurabh722/decision-engine
RUN git clone https://github.com/Saurabh722/system-logs

WORKDIR /app-server
RUN npm install

WORKDIR /accounting
RUN npm install

WORKDIR /decision-engine
RUN npm install

WORKDIR /system-logs
RUN npm install

WORKDIR /../..

CMD ["npm", "run", "build"]