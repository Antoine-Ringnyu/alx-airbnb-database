-- Airbnb Database Seed Data
-- seed.sql

-- ================================
-- Users
-- ================================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    (uuid_generate_v4(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest'),
    (uuid_generate_v4(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '2345678901', 'host'),
    (uuid_generate_v4(), 'Carol', 'Davis', 'carol@example.com', 'hashed_pw_3', '3456789012', 'host'),
    (uuid_generate_v4(), 'David', 'Lee', 'david@example.com', 'hashed_pw_4', '4567890123', 'admin');

-- ================================
-- Properties
-- ================================
-- Assume Bob and Carol are hosts
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
VALUES
    (uuid_generate_v4(), (SELECT user_id FROM users WHERE email = 'bob@example.com'),
     'Cozy Apartment', 'A nice 2-bedroom apartment in the city center.', 'New York, NY', 120.00),
    (uuid_generate_v4(), (SELECT user_id FROM users WHERE email = 'carol@example.com'),
     'Beach House', 'Beautiful beach house with ocean view.', 'Miami, FL', 250.00),
    (uuid_generate_v4(), (SELECT user_id FROM users WHERE email = 'carol@example.com'),
     'Mountain Cabin', 'Secluded cabin in the mountains.', 'Denver, CO', 180.00);

-- ================================
-- Bookings
-- ================================
-- Alice books Bob’s apartment and Carol’s beach house
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
    (uuid_generate_v4(),
     (SELECT property_id FROM properties WHERE name = 'Cozy Apartment'),
     (SELECT user_id FROM users WHERE email = 'alice@example.com'),
     '2025-09-10', '2025-09-15', 600.00, 'confirmed'),

    (uuid_generate_v4(),
     (SELECT property_id FROM properties WHERE name = 'Beach House'),
     (SELECT user_id FROM users WHERE email = 'alice@example.com'),
     '2025-10-01', '2025-10-05', 1000.00, 'pending');

-- ================================
-- Payments
-- ================================
-- Payment for confirmed booking
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
    (uuid_generate_v4(),
     (SELECT booking_id FROM bookings WHERE status = 'confirmed' LIMIT 1),
     600.00, 'credit_card');

-- ================================
-- Reviews
-- ================================
-- Alice leaves a review for Bob’s property
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
    (uuid_generate_v4(),
     (SELECT property_id FROM properties WHERE name = 'Cozy Apartment'),
     (SELECT user_id FROM users WHERE email = 'alice@example.com'),
     5, 'Amazing stay, very clean and comfortable!');

-- ================================
-- Messages
-- ================================
-- Alice sends a message to Bob (host of Cozy Apartment)
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
    (uuid_generate_v4(),
     (SELECT user_id FROM users WHERE email = 'alice@example.com'),
     (SELECT user_id FROM users WHERE email = 'bob@example.com'),
     'Hi Bob, what time is check-in for the apartment?');

-- Bob replies to Alice
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
    (uuid_generate_v4(),
     (SELECT user_id FROM users WHERE email = 'bob@example.com'),
     (SELECT user_id FROM users WHERE email = 'alice@example.com'),
     'Check-in is at 3 PM. Looking forward to hosting you!');
