#!/bin/bash
docker-compose -f microfood-compose.yml -p microfood --env-file .env up -d