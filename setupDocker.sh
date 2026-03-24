#!/bin/bash


ENV_FILE=.env
if [ ! -f "$ENV_FILE" ]; then
    echo "Environment file not found. Creating local .env from dev.env"
    cp dev.env .env
fi
BUILD_DIR=./target/distro/web
if [ ! -d "$BUILD_DIR" ]; then
    echo "Build directory not found - running mvn clean install"
    mvn clean install
fi
docker compose up --build -d
