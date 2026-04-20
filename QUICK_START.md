# 🚀 Quick Start Guide

## Project Setup ✅

✅ **GitHub Repo Created**: https://github.com/camptracker/redwood-city-apartments  
✅ **Live Website**: https://camptracker.github.io/redwood-city-apartments/  
✅ **10 Apartments Listed**: Ready for photo collection  
✅ **Image Directories Created**: All folders ready  

---

## What You Need To Do

### For Each of the 10 Apartments:

1. **Visit the apartment website** (open apartments.json to see links)
2. **Download 3-5 amenity photos** (pool, gym, lobby, etc.)
3. **Download 2-3 floor plans**
4. **Save to correct folders**
5. **Update apartments.json**

---

## Step-by-Step Workflow

### Example: Marina Shores (Apartment #1)

#### 1. Visit Website
```bash
# Website is in apartments.json:
# https://www.marinashoreapts.com
```

#### 2. Download Photos

**Amenities** (pool, gym, lobby, etc.):
- Right-click photos → "Save Image As..."
- Save to: `images/1/amenities/`
- Name: `amenity-1.jpg`, `amenity-2.jpg`, etc.

**Floor Plans**:
- Find "Floor Plans" section
- Right-click → "Save Image As..."
- Save to: `images/1/floorplans/`
- Name: `plan-1.jpg`, `plan-2.jpg`, etc.

#### 3. Use Helper Script (Optional)
```bash
cd ~/Documents/redwood-city-apartments

# After placing image in images/1/amenities/amenity-1.jpg:
./add-photos.sh 1 amenities amenity-1.jpg

# Or manually edit apartments.json
```

#### 4. Manual Update (Alternative)
Edit `apartments.json` and add filenames:
```json
{
  "id": 1,
  "name": "Marina Shores",
  ...
  "amenities": ["amenity-1.jpg", "amenity-2.jpg", "amenity-3.jpg"],
  "floorPlans": ["plan-1.jpg", "plan-2.jpg"],
  "status": "complete"
}
```

#### 5. Deploy
```bash
cd ~/Documents/redwood-city-apartments
git add -A
git commit -m "Add photos for Marina Shores"
git push
npx gh-pages -d .
```

---

## The 10 Apartments

1. **Marina Shores** - 555 Twin Dolphin Dr
2. **The Dylan** - 1001 Marshall St
3. **Elan Redwood City** - 901 Main St
4. **Flats on D** - 330 D St
5. **The Sage** - 650 Walnut St
6. **Enclave** - 700 Middlefield Rd
7. **Avalon at Redwood City** - 888 Main St
8. **The Madera** - 1301 El Camino Real
9. **Bridge Point** - 2600 Middlefield Rd
10. **Redwood Shores** - 575 Baltic Cir

*(All websites and Google Maps links are in apartments.json)*

---

## Tips

### Finding Photos Quickly
- Most apartment sites have a "Gallery" or "Amenities" section
- Floor plans are usually under "Floor Plans" or "Apartment Homes"
- Download the best quality images available

### Efficient Workflow
1. Open all 10 apartment websites in separate tabs
2. Download all amenity photos first (batch 1)
3. Then download all floor plans (batch 2)
4. Update apartments.json once at the end
5. Deploy everything in one commit

### Browser DevTools (Advanced)
If you want to bulk download images:
1. Open website in Chrome
2. Press F12 (DevTools)
3. Go to Network tab
4. Filter by "Images"
5. Right-click images → "Open in new tab" → Save all

---

## Verification

After adding photos for an apartment:
```bash
# View locally
open index.html

# Or visit live site
open https://camptracker.github.io/redwood-city-apartments/
```

---

## Current Status

📊 **Progress**: 0/10 apartments complete

All apartments are set to `"status": "pending"` in apartments.json.  
Change to `"status": "complete"` after adding photos.

---

## Need Help?

- Full guide: `DATA_COLLECTION_GUIDE.md`
- Helper script: `./add-photos.sh`
- Questions: Just ask Bob! 🔥
