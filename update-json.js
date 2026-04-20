const fs = require('fs');
const apartments = require('./apartments.json');

// Update each apartment with image filenames
apartments.forEach(apt => {
  apt.amenities = ['amenity-1.jpg', 'amenity-2.jpg', 'amenity-3.jpg'];
  apt.floorPlans = ['plan-1.jpg', 'plan-2.jpg'];
  apt.status = 'pending'; // Will be 'complete' after you add real images
});

fs.writeFileSync('apartments.json', JSON.stringify(apartments, null, 2));
console.log('✅ Updated apartments.json with image filenames');
