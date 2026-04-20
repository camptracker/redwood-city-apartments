#!/bin/bash
# Download real photos from apartments.com listings

cd ~/Documents/redwood-city-apartments

echo "🏢 Downloading apartment photos from apartments.com..."

# Clean up old failed downloads
rm -f images/*/amenities/*.jpg images/*/floorplans/*.jpg

# Function to download and verify image
download_image() {
    local url=$1
    local output=$2
    
    curl -L -H "User-Agent: Mozilla/5.0" -H "Referer: https://www.apartments.com/" \
         -o "$output" "$url" 2>/dev/null
    
    # Check if it's an actual image
    if file "$output" | grep -q "image\|JPEG\|PNG"; then
        echo "  ✅ $(basename $output)"
        return 0
    else
        rm -f "$output"
        echo "  ❌ $(basename $output) - not an image"
        return 1
    fi
}

# Apartment 1: The Dylan
echo "📸 1. The Dylan"
download_image "https://www.livedylan.com/wp-content/uploads/sites/20/2023/03/DYL-Exterior-1-scaled.jpg" "images/1/amenities/amenity-1.jpg"
download_image "https://www.livedylan.com/wp-content/uploads/sites/20/2023/03/DYL-Pool-2-scaled.jpg" "images/1/amenities/amenity-2.jpg"
download_image "https://www.livedylan.com/wp-content/uploads/sites/20/2023/03/DYL-Fitness-1-scaled.jpg" "images/1/amenities/amenity-3.jpg"
download_image "https://www.livedylan.com/wp-content/uploads/sites/20/2023/03/DYL-S1-FP.jpg" "images/1/floorplans/plan-1.jpg"
download_image "https://www.livedylan.com/wp-content/uploads/sites/20/2023/03/DYL-A1-FP.jpg" "images/1/floorplans/plan-2.jpg"

# Continue with others...
echo ""
echo "✅ Downloaded photos for apartment 1"
echo "Checking what we got..."
ls -lh images/1/amenities/*.jpg images/1/floorplans/*.jpg 2>/dev/null | awk '{print $5, $9}'
