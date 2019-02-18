FROM node:10.15.1-alpine
WORKDIR /app

COPY ./dockerfiles/start.sh /start.sh
RUN apk update \
    && apk add --no-cache git \
    && npm install -g @adonisjs/cli \
    && npm install \
    && chmod 755 /start.sh

# CMD ["adonis", "serve", "--dev"]
CMD ["sh", "/start.sh"]