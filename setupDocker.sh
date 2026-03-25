#!/bin/bash


ENV_FILE=.env
if [ ! -f "$ENV_FILE" ]; then
    echo "Environment file not found. Creating local .env from default.env"
    cp default.env .env
fi
BUILD_DIR=./target/distro/web
if [ ! -d "$BUILD_DIR" ]; then
    echo "Build directory not found - running mvn clean install"
    mvn clean install #TODO - Run this in a container
fi
docker compose up --build -d
