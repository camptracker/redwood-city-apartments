#!/bin/bash
# Download stock luxury apartment photos for all 10 apartments

echo "📸 Downloading stock apartment photos from Unsplash..."

# Unsplash apartment/luxury/modern building images (free to use)
AMENITY_URLS=(
    "https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=800"  # Pool
    "https://images.unsplash.com/photo-1576013551627-0cc20b96c2a7?w=800"  # Gym
    "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800"  # Lobby
    "https://images.unsplash.com/photo-1574643156929-51fa098b0394?w=800"  # Lounge
    "https://images.unsplash.com/photo-1581404917879-355686dc0522?w=800"  # Rooftop
    "https://images.unsplash.com/photo-1565538810643-b5bdb714032a?w=800"  # Kitchen
    "https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=800"  # Living
    "https://images.unsplash.com/photo-1600566753190-17f0baa2a6c3?w=800"  # Exterior
    "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=800"  # Modern
    "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800"  # Apartment
)

FLOOR_URLS=(
    "https://images.unsplash.com/photo-1503174971373-b1f69850bded?w=800"  # Blueprint 1
    "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800"  # Blueprint 2
    "https://images.unsplash.com/photo-1545259742-52d0354f2615?w=800"  # Floor plan
    "https://images.unsplash.com/photo-1600607687920-4e2a09cf159d?w=800"  # Layout
)

for apt_id in {1..10}; do
    echo "🏢 Apartment $apt_id..."
    
    # Download 3 amenity photos (rotate through the array)
    for i in {1..3}; do
        idx=$(( (apt_id * 3 + i - 1) % ${#AMENITY_URLS[@]} ))
        curl -L -o "images/${apt_id}/amenities/amenity-${i}.jpg" "${AMENITY_URLS[$idx]}" 2>/dev/null
    done
    
    # Download 2 floor plans (rotate through the array)
    for i in {1..2}; do
        idx=$(( (apt_id * 2 + i - 1) % ${#FLOOR_URLS[@]} ))
        curl -L -o "images/${apt_id}/floorplans/plan-${i}.jpg" "${FLOOR_URLS[$idx]}" 2>/dev/null
    done
    
    echo "  ✅ Downloaded 3 amenities + 2 floor plans"
done

echo ""
echo "✅ All stock photos downloaded!"
echo "Total files:"
find images -name "*.jpg" | wc -l
