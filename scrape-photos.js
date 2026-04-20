#!/usr/bin/env node

/**
 * Apartment Photo Scraper
 * Visits each apartment website and downloads amenity + floor plan images
 */

const playwright = require('playwright');
const fs = require('fs');
const path = require('path');
const https = require('https');
const http = require('http');

const apartments = require('./apartments.json');

async function downloadImage(url, filepath) {
  return new Promise((resolve, reject) => {
    const file = fs.createWriteStream(filepath);
    const protocol = url.startsWith('https') ? https : http;
    
    protocol.get(url, (response) => {
      response.pipe(file);
      file.on('finish', () => {
        file.close();
        resolve();
      });
    }).on('error', (err) => {
      fs.unlink(filepath, () => {});
      reject(err);
    });
  });
}

async function scrapeApartment(apartment, browser) {
  console.log(`\n🏢 Scraping: ${apartment.name}`);
  console.log(`   URL: ${apartment.website}`);
  
  const context = await browser.newContext({
    userAgent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36'
  });
  
  const page = await context.newPage();
  
  try {
    await page.goto(apartment.website, { 
      waitUntil: 'networkidle',
      timeout: 30000 
    });
    
    await page.waitForTimeout(3000);
    
    // Find all images on the page
    const images = await page.evaluate(() => {
      const imgs = [];
      document.querySelectorAll('img').forEach(img => {
        const src = img.src;
        const alt = img.alt || '';
        const width = img.naturalWidth || 0;
        const height = img.naturalHeight || 0;
        
        if (width > 300 && height > 200) {
          imgs.push({ src, alt, width, height });
        }
      });
      return imgs;
    });
    
    console.log(`   Found ${images.length} large images`);
    
    // Download amenity photos (pool, gym, lobby keywords)
    const amenityImages = images.filter(img => {
      const text = (img.alt + img.src).toLowerCase();
      return text.includes('pool') || text.includes('gym') || 
             text.includes('fitness') || text.includes('amenity') ||
             text.includes('lobby') || text.includes('courtyard') ||
             text.includes('lounge') || text.includes('club');
    }).slice(0, 5);
    
    // Download floor plan images
    const floorPlanImages = images.filter(img => {
      const text = (img.alt + img.src).toLowerCase();
      return text.includes('floor') || text.includes('plan') ||
             text.includes('layout') || text.includes('bedroom');
    }).slice(0, 3);
    
    console.log(`   Amenity images: ${amenityImages.length}`);
    console.log(`   Floor plan images: ${floorPlanImages.length}`);
    
    const downloaded = {
      amenities: [],
      floorPlans: []
    };
    
    // Download amenities
    for (let i = 0; i < amenityImages.length; i++) {
      const filename = `amenity-${i + 1}.jpg`;
      const filepath = path.join(__dirname, `images/${apartment.id}/amenities/${filename}`);
      
      try {
        await downloadImage(amenityImages[i].src, filepath);
        downloaded.amenities.push(filename);
        console.log(`   ✅ Downloaded amenity-${i + 1}.jpg`);
      } catch (err) {
        console.log(`   ❌ Failed amenity-${i + 1}: ${err.message}`);
      }
    }
    
    // Download floor plans
    for (let i = 0; i < floorPlanImages.length; i++) {
      const filename = `plan-${i + 1}.jpg`;
      const filepath = path.join(__dirname, `images/${apartment.id}/floorplans/${filename}`);
      
      try {
        await downloadImage(floorPlanImages[i].src, filepath);
        downloaded.floorPlans.push(filename);
        console.log(`   ✅ Downloaded plan-${i + 1}.jpg`);
      } catch (err) {
        console.log(`   ❌ Failed plan-${i + 1}: ${err.message}`);
      }
    }
    
    await context.close();
    return downloaded;
    
  } catch (error) {
    console.log(`   ❌ Error: ${error.message}`);
    await context.close();
    return { amenities: [], floorPlans: [] };
  }
}

async function main() {
  console.log('🚀 Starting apartment photo scraper...\n');
  
  const browser = await playwright.chromium.launch({ 
    headless: false  // Set to true to run in background
  });
  
  const results = [];
  
  for (const apt of apartments) {
    const downloaded = await scrapeApartment(apt, browser);
    
    // Update apartment object
    apt.amenities = downloaded.amenities;
    apt.floorPlans = downloaded.floorPlans;
    apt.status = (downloaded.amenities.length > 0 || downloaded.floorPlans.length > 0) 
      ? 'complete' : 'pending';
    
    results.push(apt);
    
    // Be polite - wait between requests
    await new Promise(resolve => setTimeout(resolve, 2000));
  }
  
  await browser.close();
  
  // Save updated apartments.json
  fs.writeFileSync('apartments.json', JSON.stringify(results, null, 2));
  console.log('\n✅ Updated apartments.json with downloaded images');
  console.log(`\n📊 Summary:`);
  
  const complete = results.filter(a => a.status === 'complete').length;
  console.log(`   Complete: ${complete}/10 apartments`);
  console.log(`   Total amenity photos: ${results.reduce((sum, a) => sum + a.amenities.length, 0)}`);
  console.log(`   Total floor plans: ${results.reduce((sum, a) => sum + a.floorPlans.length, 0)}`);
}

main().catch(console.error);
