#!/bin/bash
# Helper script to add photos and update apartments.json

# Usage: ./add-photos.sh <apartment_id> <type> <photo_filename>
# Example: ./add-photos.sh 1 amenities amenity-1.jpg

APARTMENT_ID=$1
TYPE=$2  # "amenities" or "floorPlans"
FILENAME=$3

if [ -z "$APARTMENT_ID" ] || [ -z "$TYPE" ] || [ -z "$FILENAME" ]; then
    echo "Usage: ./add-photos.sh <apartment_id> <type> <photo_filename>"
    echo "Example: ./add-photos.sh 1 amenities amenity-1.jpg"
    exit 1
fi

# Check if file exists in the correct directory
if [ "$TYPE" == "amenities" ]; then
    DIR="images/$APARTMENT_ID/amenities"
elif [ "$TYPE" == "floorPlans" ]; then
    DIR="images/$APARTMENT_ID/floorplans"
else
    echo "Error: Type must be 'amenities' or 'floorPlans'"
    exit 1
fi

if [ ! -f "$DIR/$FILENAME" ]; then
    echo "Error: File $DIR/$FILENAME does not exist"
    echo "Please copy your image to this location first"
    exit 1
fi

# Update apartments.json using jq
echo "Adding $FILENAME to apartment $APARTMENT_ID ($TYPE)..."

# Use Python to update the JSON since jq might not be available
python3 << EOF
import json

with open('apartments.json', 'r') as f:
    data = json.load(f)

for apt in data:
    if apt['id'] == $APARTMENT_ID:
        if '$TYPE' not in apt or apt['$TYPE'] is None:
            apt['$TYPE'] = []
        if '$FILENAME' not in apt['$TYPE']:
            apt['$TYPE'].append('$FILENAME')
        print(f"Added {apt['name']} -> $TYPE -> $FILENAME")
        break

with open('apartments.json', 'w') as f:
    json.dump(data, f, indent=2)

print("✅ apartments.json updated!")
EOF

echo ""
echo "Next steps:"
echo "1. Open index.html in browser to verify"
echo "2. git add -A && git commit -m 'Add photos for apartment $APARTMENT_ID'"
echo "3. git push"
echo "4. npx gh-pages -d ."
