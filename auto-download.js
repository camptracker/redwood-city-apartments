#!/usr/bin/env node
const playwright = require('playwright');
const fs = require('fs');
const path = require('path');

async function downloadImage(page, url, filepath) {
  try {
    const response = await page.goto(url, { waitUntil: 'networkidle', timeout: 15000 });
    const buffer = await response.body();
    fs.writeFileSync(filepath, buffer);
    return true;
  } catch (err) {
    console.log(`  ❌ Failed: ${err.message}`);
    return false;
  }
}

async function scrapeApartment(apartment, page) {
  console.log(`\n🏢 ${apartment.name}`);
  
  try {
    await page.goto(apartment.website + '/photos', { waitUntil: 'domcontentloaded', timeout: 20000 });
    await page.waitForTimeout(3000);
    
    // Get all image URLs
    const images = await page.$$eval('img', imgs => 
      imgs.map(img => ({
        src: img.src,
        alt: img.alt || '',
        width: img.naturalWidth || 0
      }))
      .filter(img => img.width > 400 && !img.src.includes('logo') && !img.src.includes('icon'))
    );
    
    console.log(`  Found ${images.length} images`);
    
    // Download first 3 as amenities
    for (let i = 0; i < Math.min(3, images.length); i++) {
      const filepath = path.join(__dirname, `images/${apartment.id}/amenities/amenity-${i+1}.jpg`);
      console.log(`  Downloading amenity ${i+1}...`);
      const buffer = await page.evaluate(async (src) => {
        const res = await fetch(src);
        const blob = await res.blob();
        const buffer = await blob.arrayBuffer();
        return Array.from(new Uint8Array(buffer));
      }, images[i].src);
      
      fs.writeFileSync(filepath, Buffer.from(buffer));
      console.log(`  ✅ Saved amenity-${i+1}.jpg`);
    }
    
    // Try to get floor plans
    await page.goto(apartment.website + '/floorplans', { waitUntil: 'domcontentloaded', timeout: 20000 });
    await page.waitForTimeout(3000);
    
    const floorplans = await page.$$eval('img', imgs => 
      imgs.map(img => ({
        src: img.src,
        alt: img.alt || ''
      }))
      .filter(img => 
        img.alt.toLowerCase().includes('floor') ||
        img.alt.toLowerCase().includes('plan') ||
        img.src.toLowerCase().includes('floor') ||
        img.src.toLowerCase().includes('plan')
      )
    );
    
    console.log(`  Found ${floorplans.length} floor plans`);
    
    for (let i = 0; i < Math.min(2, floorplans.length); i++) {
      const filepath = path.join(__dirname, `images/${apartment.id}/floorplans/plan-${i+1}.jpg`);
      console.log(`  Downloading plan ${i+1}...`);
      const buffer = await page.evaluate(async (src) => {
        const res = await fetch(src);
        const blob = await res.blob();
        const buffer = await blob.arrayBuffer();
        return Array.from(new Uint8Array(buffer));
      }, floorplans[i].src);
      
      fs.writeFileSync(filepath, Buffer.from(buffer));
      console.log(`  ✅ Saved plan-${i+1}.jpg`);
    }
    
  } catch (err) {
    console.log(`  ❌ Error: ${err.message}`);
  }
}

async function main() {
  const apartments = require('./apartments.json');
  
  console.log('🚀 Starting photo download...\n');
  
  const browser = await playwright.chromium.launch({ 
    headless: false,
    slowMo: 100
  });
  
  const page = await browser.newPage({
    userAgent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36'
  });
  
  // Only do first 3 apartments for now
  for (let i = 0; i < Math.min(3, apartments.length); i++) {
    await scrapeApartment(apartments[i], page);
    await page.waitForTimeout(2000);
  }
  
  await browser.close();
  console.log('\n✅ Done!');
}

main().catch(console.error);
