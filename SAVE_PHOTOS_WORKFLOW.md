# 📸 Save Photos Workflow

I'll open each apartment website for you. Just **right-click → Save Image As...** for each photo.

## For Each Apartment:

### Save To:
- **Amenities:** `~/Documents/redwood-city-apartments/images/{number}/amenities/`
- **Floor Plans:** `~/Documents/redwood-city-apartments/images/{number}/floorplans/`

### File Names:
- `amenity-1.jpg`, `amenity-2.jpg`, `amenity-3.jpg`
- `plan-1.jpg`, `plan-2.jpg`

---

## The 10 Apartments (Opening Now)

### 1. The Dylan ✅ OPEN
**Folder:** `images/1/`
- Get 3 amenity photos (pool, gym, lobby)
- Get 2 floor plans

### 2. Elan Redwood City (Next)
**Folder:** `images/2/`

### 3-10. (Will open after you finish each one)

---

## After Saving Photos:

Run this to update the website:
```bash
cd ~/Documents/redwood-city-apartments
node update-with-photos.js
git add -A
git commit -m "Add real apartment photos"
git push
npx gh-pages -d .
```

---

**Ready?** Start with The Dylan (already open), then tell me when you're done and I'll open the next one.
