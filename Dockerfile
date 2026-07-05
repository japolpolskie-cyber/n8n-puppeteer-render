FROM docker.n8n.io/n8nio/n8n:latest-debian

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    chromium \
    && rm -rf /var/lib/apt/lists/*

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

RUN mkdir -p /home/node/.n8n/nodes && \
    npm install --prefix /home/node/.n8n n8n-nodes-puppeteer

USER node
