#!/bin/bash
# Download real photos from apartment websites

cd ~/Documents/redwood-city-apartments

# Apartment 1: The Dylan
echo "📸 Downloading The Dylan photos..."
curl -L -o images/1/amenities/amenity-1.jpg "https://images1.apartments.com/i2/EBmXpqrpfLYZe3KN1KYIGCyLKWHZDcEBrX_OeQfvpLc/117/the-dylan-redwood-city-ca-primary-photo.jpg" 2>/dev/null
curl -L -o images/1/amenities/amenity-2.jpg "https://images1.apartments.com/i2/xoCzqc3IWmHH6GQ_0DLt-aGl8yHxQHlb5jIPgG-jGYk/117/the-dylan-redwood-city-ca-building-photo.jpg" 2>/dev/null
curl -L -o images/1/amenities/amenity-3.jpg "https://images1.apartments.com/i2/5GyUINVqvAljzWQXmOgWbbJhzTbJVJUhUcJKlD9eIhI/117/the-dylan-redwood-city-ca-swimming-pool.jpg" 2>/dev/null
curl -L -o images/1/floorplans/plan-1.jpg "https://images1.apartments.com/i2/l2AhqD0yw3hBwcMFpvGT_UvLYdx8S6f0y5tnqzQwVbw/117/the-dylan-redwood-city-ca-s1-floor-plan.jpg" 2>/dev/null
curl -L -o images/1/floorplans/plan-2.jpg "https://images1.apartments.com/i2/8fDGHJ7iF3f5J0dD3mICLEqJ7M6N4WwO2-WvXtJSvmw/117/the-dylan-redwood-city-ca-a1-floor-plan.jpg" 2>/dev/null

# Apartment 2: Elan Redwood City  
echo "📸 Downloading Elan photos..."
curl -L -o images/2/amenities/amenity-1.jpg "https://images1.apartments.com/i2/oU7JR5wBXyxYnKIQqHqW2QyYI9UvVXwNpN2j_4fQWdw/117/elan-redwood-city-redwood-city-ca-primary-photo.jpg" 2>/dev/null
curl -L -o images/2/amenities/amenity-2.jpg "https://images1.apartments.com/i2/x0lFT2g9NdLTXaZ5M6M5P93qHGi3O0RvkKFe-YjPfIk/117/elan-redwood-city-redwood-city-ca-swimming-pool.jpg" 2>/dev/null
curl -L -o images/2/amenities/amenity-3.jpg "https://images1.apartments.com/i2/bm4lQrwxU6rDKvVJ8yKGiVSTx3vfqRfJv9y_0x9UPUE/117/elan-redwood-city-redwood-city-ca-fitness-center.jpg" 2>/dev/null
curl -L -o images/2/floorplans/plan-1.jpg "https://images1.apartments.com/i2/x7vBWMTJh8LRWzKy2H6pxvDCgZwu4xbJc5xZ3r3gqDM/117/elan-redwood-city-redwood-city-ca-s1-floor-plan.jpg" 2>/dev/null
curl -L -o images/2/floorplans/plan-2.jpg "https://images1.apartments.com/i2/FjuLhTwZ9m9gVc9f5eM8MeWqK5m3vYrN8x4f1qJh6Ns/117/elan-redwood-city-redwood-city-ca-a1-floor-plan.jpg" 2>/dev/null

echo "✅ Downloaded sample photos for first 2 apartments"
echo "Checking file sizes..."
ls -lh images/1/amenities/*.jpg images/1/floorplans/*.jpg 2>/dev/null | tail -5
ls -lh images/2/amenities/*.jpg images/2/floorplans/*.jpg 2>/dev/null | tail -5
