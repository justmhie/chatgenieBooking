User.destroy_all
Hotel.destroy_all
RoomType.destroy_all
Booking.destroy_all
Review.destroy_all

mateo = User.create(first_name: 'Mateo', last_name: 'Lazo', email: 'mateo@email.com', password: 'Mateo1', password_confirmation: 'Mateo1', role: 'editor')
julian = User.create(first_name: 'Julian', last_name: 'Jones', email: 'julian@email.com', password: 'Julian1', password_confirmation: 'Julian1')
freida = User.create(first_name: 'Freida', last_name: 'Gray', email: 'freida@email.com', password: 'Freida1', password_confirmation: 'Freida1', role: 'admin')


# Sample Hotels
hotel1 = Hotel.create!(
  hotel_name: 'Grand Palace Hotel',
  description: 'A luxurious hotel with a beautiful view of the city skyline.',
  location: '123 Main Street, Metropolis',
  contact_details: 'contact@grandpalace.com, +123456789',
  amenities: 'Free WiFi, Swimming Pool, Spa, Gym',
  photo_gallery: 'https://digital.ihg.com/is/image/ihg/independent--sphc--vienna-7550939683-4x3'
)

hotel2 = Hotel.create!(
  hotel_name: 'Coastal Retreat',
  description: 'A serene getaway by the sea with private beaches.',
  location: '456 Beach Avenue, Seaside',
  contact_details: 'info@coastalretreat.com, +987654321',
  amenities: 'Private Beach, Water Sports, All-inclusive',
  photo_gallery: 'https://www.kayak.com.ph/rimg/kimg/d1/4b/5bd2057e1e8927ce.jpg?width=1366&height=768&crop=true'
)

hotel3 = Hotel.create!(
  hotel_name: 'Mountain View Inn',
  description: 'Charming inn located in the mountains with breathtaking views.',
  location: '789 Mountain Road, Highlands',
  contact_details: 'stay@mountainview.com, +192837465',
  amenities: 'Hiking Trails, Fireplace, Free Breakfast',
  photo_gallery: 'https://www.kayak.com.ph/rimg/himg/c7/2b/6a/leonardo-3067847-EXTERIOR_O-954588.jpg?width=1366&height=768&crop=true'
)

# Sample Room Types
# Create room types for the hotels
RoomType.create!(
  hotel: hotel1,
  name: 'Deluxe Suite',
  description: 'Spacious room with a view.',
  capacity: 2,
  price_per_night: 200.00
)

RoomType.create!(
  hotel: hotel1,
  name: 'Standard Room',
  description: 'Comfortable room with basic amenities.',
  capacity: 2,
  price_per_night: 150.00
)

RoomType.create!(
  hotel: hotel2,
  name: 'Beachfront Room',
  description: 'Room with direct beach access.',
  capacity: 2,
  price_per_night: 300.00
)

RoomType.create!(
  hotel: hotel2,
  name: 'Economy Room',
  description: 'Affordable room with necessary amenities.',
  capacity: 2,
  price_per_night: 100.00
)


# Sample Bookings
Booking.create!(
  user: user1,
  hotel: hotel1,
  check_in_date: '2024-08-01',
  check_out_date: '2024-08-05',
  room_type: hotel1.room_types.first,
  status: 'confirmed'
)

Booking.create!(
  user: user2,
  hotel: hotel2,
  check_in_date: '2024-09-10',
  check_out_date: '2024-09-15',
  room_type: hotel2.room_types.first,
  status: 'pending'
)

Booking.create!(
  user: user3,
  hotel: hotel3,
  check_in_date: '2024-10-20',
  check_out_date: '2024-10-25',
  room_type: hotel3.room_types.first,
  status: 'cancelled'
)

# Sample Reviews
Review.create!(
  user: user1,
  hotel: hotel1,
  rating: 5,
  comment: 'Amazing experience! The suite was fantastic and the staff was very friendly.',
  date: '2024-08-06'
)

Review.create!(
  user: user2,
  hotel: hotel2,
  rating: 4,
  comment: 'Great location and amenities. The beach was beautiful.',
  date: '2024-09-16'
)

Review.create!(
  user: user3,
  hotel: hotel3,
  rating: 3,
  comment: 'The cabin was cozy but a bit outdated. Overall a pleasant stay.',
  date: '2024-10-26'
)