#!/bin/bash
# Create placeholder images for all apartments

for i in {1..10}; do
    # Create amenity placeholders
    for j in {1..5}; do
        convert -size 800x600 xc:lightblue \
            -gravity center \
            -pointsize 48 \
            -fill white \
            -annotate +0+0 "Amenity Photo ${j}\nApartment ${i}\n\n(Replace with real photo)" \
            "images/${i}/amenities/amenity-${j}.jpg" 2>/dev/null
    done
    
    # Create floor plan placeholders
    for j in {1..3}; do
        convert -size 800x600 xc:lightgreen \
            -gravity center \
            -pointsize 48 \
            -fill white \
            -annotate +0+0 "Floor Plan ${j}\nApartment ${i}\n\n(Replace with real plan)" \
            "images/${i}/floorplans/plan-${j}.jpg" 2>/dev/null
    done
    
    echo "✅ Created placeholders for apartment ${i}"
done

echo ""
echo "✅ All placeholder images created!"
echo "Now update apartments.json to reference these files."
