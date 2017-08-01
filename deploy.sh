#!/bin/bash
docker build -t ckotte/tor-privoxy-alpine .
#docker push ckotte/tor-privoxy-alpine

docker stop tor-privoxy-alpine || true
docker rm tor-privoxy-alpine || true
docker rmi ckotte/tor-privoxy-alpine:current || true
docker tag ckotte/tor-privoxy-alpine:latest ckotte/tor-privoxy-alpine:current
docker run -d --restart always --name tor-privoxy-alpine -p 8118:8118 -p 9050:9050 ckotte/tor-privoxy-alpine:current
