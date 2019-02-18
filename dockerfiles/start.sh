#!/bin/bash
# set -x #echo on

cd /app

if [[ -z "$(ls -A $PWD 2>/dev/null)" ]]; then
    adonis new .
    sed -i -e "s/HOST=.*/HOST=0.0.0.0/g" $PWD/.env
    sed -i -e "s/DB_HOST=.*/DB_HOST=db/g" $PWD/.env
    sed -i -e "s/DB_CONNECTION=.*/DB_CONNECTION=mysql/g" $PWD/.env
fi

if [[ -z "$(ls -A $PWD | grep .env)" ]]; then
    echo "no .env file found."
    exit 1
fi

# source the .env file so we can use the variables
source $PWD/.env

if [[ "$NODE_ENV" == "production" ]]; then
    adonis serve
else
    adonis serve --dev
fi
