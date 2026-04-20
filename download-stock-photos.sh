#!/bin/bash
# Download stock apartment/luxury photos from Unsplash as placeholders

# Unsplash apartment/luxury images (free to use)
curl -L -o images/1/amenities/amenity-1.jpg "https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=800" 2>/dev/null
curl -L -o images/1/amenities/amenity-2.jpg "https://images.unsplash.com/photo-1576013551627-0cc20b96c2a7?w=800" 2>/dev/null
curl -L -o images/1/amenities/amenity-3.jpg "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800" 2>/dev/null
curl -L -o images/1/floorplans/plan-1.jpg "https://images.unsplash.com/photo-1503174971373-b1f69850bded?w=800" 2>/dev/null
curl -L -o images/1/floorplans/plan-2.jpg "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800" 2>/dev/null

echo "Downloaded stock photos for apartment 1 as placeholders"
ls -lh images/1/amenities/*.jpg images/1/floorplans/*.jpg 2>/dev/null | awk '{print $5, $9}'
