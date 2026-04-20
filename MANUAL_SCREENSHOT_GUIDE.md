# 📸 Manual Screenshot Guide

## Quick Workflow (10-15 minutes total)

For each apartment, visit the website and take screenshots. This is faster and higher-quality than automated scraping.

---

## The 10 Apartments

### 1. The Dylan
- **Website:** https://www.livedylan.com/
- **What to capture:**
  - Amenities: Pool, Fitness Center, Rooftop Deck
  - Floor Plans: Studio, 1BR, 2BR
- **Save to:** `images/1/amenities/` and `images/1/floorplans/`

### 2. Elan Redwood City
- **Website:** https://www.elanredwoodcity.com/
- **What to capture:**
  - Amenities: Pool, Fitness Studio, Sky Lounge
  - Floor Plans: Studio, 1BR, 2BR
- **Save to:** `images/2/amenities/` and `images/2/floorplans/`

### 3. The Flats on D
- **Website:** https://www.flatsond.com/
- **What to capture:**
  - Amenities: Pool, Gym, Game Room
  - Floor Plans: Studio, 1BR, 2BR
- **Save to:** `images/3/amenities/` and `images/3/floorplans/`

### 4. The Sage
- **Website:** https://www.thesagerwc.com/
- **What to capture:**
  - Amenities: Pool, Fitness Center, Courtyard
  - Floor Plans: 1BR, 2BR
- **Save to:** `images/4/amenities/` and `images/4/floorplans/`

### 5. Avalon at Redwood City
- **Website:** https://www.avaloncommunities.com/california/redwood-city-apartments/avalon-at-redwood-city
- **What to capture:**
  - Amenities: Pool, Fitness, Rooftop Terrace
  - Floor Plans: Studio, 1BR, 2BR
- **Save to:** `images/5/amenities/` and `images/5/floorplans/`

### 6. The Madera
- **Website:** https://www.themaderarwc.com/
- **What to capture:**
  - Amenities: Pool, Gym, Clubhouse
  - Floor Plans: Studio, 1BR, 2BR
- **Save to:** `images/6/amenities/` and `images/6/floorplans/`

### 7. Bridge Point
- **Website:** https://www.bridgepointapts.com/
- **What to capture:**
  - Amenities: Pool, Fitness, Tennis
  - Floor Plans: 1BR, 2BR, 3BR
- **Save to:** `images/7/amenities/` and `images/7/floorplans/`

### 8. Harbor Point
- **Website:** https://www.sequoia.com/properties/harbor-point
- **What to capture:**
  - Amenities: Pool, Waterfront, Marina
  - Floor Plans: 1BR, 2BR, 3BR
- **Save to:** `images/8/amenities/` and `images/8/floorplans/`

### 9. Mariner's Island
- **Website:** https://www.marinersisland.com/
- **What to capture:**
  - Amenities: Pool, Tennis, Waterfront
  - Floor Plans: 1BR, 2BR, Townhomes
- **Save to:** `images/9/amenities/` and `images/9/floorplans/`

### 10. Altaire
- **Website:** https://www.altairerwc.com/
- **What to capture:**
  - Amenities: Rooftop Pool, Sky Lounge, Pet Spa
  - Floor Plans: Studio, 1BR, 2BR, Penthouse
- **Save to:** `images/10/amenities/` and `images/10/floorplans/`

---

## Screenshot Method

### Option 1: Full-Page Screenshot (Recommended)
1. Visit website
2. Press **Cmd+Shift+4** (Mac) or use Chrome DevTools
3. Take clean screenshots of gallery images
4. Save with correct names: `amenity-1.jpg`, `amenity-2.jpg`, `plan-1.jpg`, etc.

### Option 2: Right-Click Save
1. Visit website
2. Find high-res images
3. Right-click → "Save Image As..."
4. Name correctly and save to appropriate folder

### Option 3: Bulk Download via Browser DevTools
1. Open website
2. Press F12 (DevTools)
3. Network tab → Filter: Images
4. Reload page
5. Right-click images → "Open in new tab" → Save all

---

## After Screenshots

### Deploy to GitHub Pages:
```bash
cd ~/Documents/redwood-city-apartments
git add -A
git commit -m "Add real apartment photos"
git push
npx gh-pages -d .
```

### View live site:
https://camptracker.github.io/redwood-city-apartments/

---

## Tips

- **Quality:** Get highest resolution images available
- **Consistency:** Try to get similar angles for each apartment type
- **Naming:** Stick to `amenity-1.jpg` format (lowercase, hyphen, number)
- **File size:** Optimize if > 500KB using online tools

---

## Estimated Time

- **Per apartment:** 1-2 minutes
- **Total for all 10:** 10-20 minutes
- Much faster than automated scraping + better quality!
