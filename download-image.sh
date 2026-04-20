#!/bin/bash
# Download image from URL to specific apartment folder
# Usage: ./download-image.sh <apartment_id> <type> <url> <filename>

APT_ID=$1
TYPE=$2  # amenities or floorplans
URL=$3
FILENAME=$4

if [ -z "$APT_ID" ] || [ -z "$TYPE" ] || [ -z "$URL" ] || [ -z "$FILENAME" ]; then
    echo "Usage: ./download-image.sh <apartment_id> <type> <url> <filename>"
    exit 1
fi

DIR="images/$APT_ID/$TYPE"
mkdir -p "$DIR"

echo "Downloading $URL..."
curl -L -o "$DIR/$FILENAME" "$URL"

if [ -f "$DIR/$FILENAME" ]; then
    echo "✅ Saved to $DIR/$FILENAME"
else
    echo "❌ Download failed"
    exit 1
fi
