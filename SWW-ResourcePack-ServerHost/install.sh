#!/bin/bash
set -e
cd "$(dirname "$0")"

echo "Starting SWW resource-pack web server..."
docker compose up -d

echo
echo "Resource pack file:"
echo "  SWW-Java-v0.8.1-ModelFix.zip"
echo
echo "SHA1:"
echo "  7576ca50943d2fccc1cecfab5530587b9448bfd8"
echo
echo
echo "Local test URL:"
echo "  http://127.0.0.1:8088/SWW-Java-v0.8.1-ModelFix.zip"
echo
echo "IMPORTANT:"
echo "Players need a PUBLIC URL. If your Minecraft server is behind Playit,"
echo "create a TCP tunnel for local port 8088 and put the resulting public"
echo "host/port in server.properties resource-pack=..."
