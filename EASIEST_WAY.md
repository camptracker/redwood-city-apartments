# ✅ Easiest Way to Get Real Apartment Photos

The apartment websites have bot protection, so here's the **fastest manual approach** (5-10 minutes total):

---

## Quick Steps:

### 1. Visit apartments.com
Open: https://www.apartments.com/redwood-city-ca/

### 2. Search for each apartment
Type the apartment name in the search box

### 3. On each listing:
- Click "Photos" or "Gallery"  
- Right-click → "Save Image As..."
- Save 3 amenity photos to: `~/Documents/redwood-city-apartments/images/{number}/amenities/`
- Name them: `amenity-1.jpg`, `amenity-2.jpg`, `amenity-3.jpg`

- Click "Floor Plans"
- Right-click → "Save Image As..."  
- Save 2 floor plans to: `~/Documents/redwood-city-apartments/images/{number}/floorplans/`
- Name them: `plan-1.jpg`, `plan-2.jpg`

### 4. After all 10 apartments:
```bash
cd ~/Documents/redwood-city-apartments
node update-with-photos.js
git add -A
git commit -m "Add real apartment photos"
git push
npx gh-pages -d .
```

---

## The 10 Apartments (in order):

1. **The Dylan** → Folder: `images/1/`
2. **Elan Redwood City** → Folder: `images/2/`
3. **The Flats on D** → Folder: `images/3/`
4. **The Sage** → Folder: `images/4/`
5. **Avalon at Redwood City** → Folder: `images/5/`
6. **The Madera** → Folder: `images/6/`
7. **Bridge Point** → Folder: `images/7/`
8. **Harbor Point** → Folder: `images/8/`
9. **Mariner's Island** → Folder: `images/9/`
10. **Altaire** → Folder: `images/10/`

---

## Time Estimate:
- **Per apartment:** 30-60 seconds  
- **Total:** 5-10 minutes

---

## Alternative:
Leave the site as-is (shows "⏳ Data collection in progress...") until you have time to add photos later. The site still shows all the apartment info, links, and looks professional!

**Current live site:** https://camptracker.github.io/redwood-city-apartments/
