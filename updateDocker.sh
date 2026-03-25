#!/bin/bash


mvn clean install #TODO - Run this in a container
docker compose down
docker compose up --build -d
