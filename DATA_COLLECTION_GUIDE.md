# Data Collection Guide

## Quick Start

For each apartment (1-10), you need to:
1. Visit the apartment website
2. Download 3-5 amenity photos
3. Download 2-3 floor plan images
4. Save them to the correct folder

## Step-by-Step Process

### For Each Apartment:

1. **Open the apartment website** (links in `apartments.json`)

2. **Download Amenity Photos** (pool, gym, lobby, clubhouse, etc.)
   - Right-click on photos → "Save Image As..."
   - Save to: `images/{apartment_id}/amenities/`
   - Name them: `amenity-1.jpg`, `amenity-2.jpg`, etc.
   - Get 3-5 photos total

3. **Download Floor Plan Images**
   - Look for "Floor Plans" section
   - Right-click → "Save Image As..."
   - Save to: `images/{apartment_id}/floorplans/`
   - Name them: `plan-1.jpg`, `plan-2.jpg`, etc.
   - Get 2-3 floor plans

4. **Update apartments.json**
   - Add filenames to the `amenities` and `floorPlans` arrays
   - Change `status` from `"pending"` to `"complete"`

## Example for Apartment #1 (Marina Shores):

After downloading photos, your `apartments.json` should look like:

```json
{
  "id": 1,
  "name": "Marina Shores",
  "address": "555 Twin Dolphin Dr, Redwood City, CA 94065",
  "website": "https://www.marinashoreapts.com",
  "googleMapsUrl": "https://maps.google.com/?q=Marina+Shores+Redwood+City",
  "amenities": [
    "amenity-1.jpg",
    "amenity-2.jpg",
    "amenity-3.jpg"
  ],
  "floorPlans": [
    "plan-1.jpg",
    "plan-2.jpg"
  ],
  "status": "complete"
}
```

## Batch Download Script (Optional)

If you want to automate screenshot capture, you can use this approach:

1. Open the apartment website in Chrome
2. Navigate to the amenities/gallery section
3. Use the browser's developer tools to bulk download images
4. Or use a screenshot tool to capture the page sections

## Verification

After collecting all data:
1. Open `index.html` in a browser
2. Verify all images load correctly
3. Click the website and maps links to confirm they work
4. Check that the lightbox opens when clicking photos

## Progress Tracking

- [ ] Apartment 1: Marina Shores
- [ ] Apartment 2: The Dylan
- [ ] Apartment 3: Elan Redwood City
- [ ] Apartment 4: Flats on D
- [ ] Apartment 5: The Sage
- [ ] Apartment 6: Enclave
- [ ] Apartment 7: Avalon at Redwood City
- [ ] Apartment 8: The Madera
- [ ] Apartment 9: Bridge Point
- [ ] Apartment 10: Redwood Shores

## Tips

- **Consistent naming**: Use the same naming pattern for all apartments
- **Image quality**: Download high-resolution images when available
- **File size**: Optimize images if they're > 500KB (use online compressors)
- **Copyright**: These are for personal reference/comparison purposes
