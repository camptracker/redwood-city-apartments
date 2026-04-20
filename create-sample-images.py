#!/usr/bin/env python3
"""
Create sample placeholder images for the apartment gallery
"""
from PIL import Image, ImageDraw, ImageFont
import os

def create_image(text, filename, color, size=(800, 600)):
    """Create a placeholder image with text"""
    img = Image.new('RGB', size, color=color)
    draw = ImageDraw.Draw(img)
    
    # Try to use a nice font, fall back to default
    try:
        font = ImageFont.truetype("/System/Library/Fonts/Helvetica.ttc", 60)
        font_small = ImageFont.truetype("/System/Library/Fonts/Helvetica.ttc", 40)
    except:
        font = ImageFont.load_default()
        font_small = font
    
    # Draw text
    bbox = draw.textbbox((0, 0), text, font=font)
    text_width = bbox[2] - bbox[0]
    text_height = bbox[3] - bbox[1]
    
    x = (size[0] - text_width) / 2
    y = (size[1] - text_height) / 2
    
    draw.text((x, y), text, fill='white', font=font)
    
    # Add subtitle
    subtitle = "Click to view full size"
    bbox2 = draw.textbbox((0, 0), subtitle, font=font_small)
    sub_width = bbox2[2] - bbox2[0]
    draw.text(((size[0] - sub_width) / 2, y + 100), subtitle, fill='white', font=font_small)
    
    img.save(filename, 'JPEG', quality=85)
    print(f"  ✅ Created {os.path.basename(filename)}")

# Create images for all 10 apartments
base_dir = "/Users/openclaw/Documents/redwood-city-apartments"

amenity_colors = [
    ('#4A90E2', 'Pool'),           # Blue
    ('#E24A4A', 'Fitness Center'),  # Red  
    ('#4AE290', 'Clubhouse'),       # Green
]

floorplan_colors = [
    ('#9B59B6', 'Studio'),          # Purple
    ('#3498DB', '1 Bedroom'),       # Blue
]

for apt_id in range(1, 11):
    print(f"\n🏢 Apartment {apt_id}")
    
    # Create amenity photos
    for i, (color, label) in enumerate(amenity_colors, 1):
        filename = f"{base_dir}/images/{apt_id}/amenities/amenity-{i}.jpg"
        create_image(label, filename, color)
    
    # Create floor plans
    for i, (color, label) in enumerate(floorplan_colors, 1):
        filename = f"{base_dir}/images/{apt_id}/floorplans/plan-{i}.jpg"
        create_image(label, filename, color)

print("\n✅ All sample images created!")
