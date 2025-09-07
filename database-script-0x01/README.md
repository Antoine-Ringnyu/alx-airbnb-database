# Airbnb Database Schema

## Overview
This directory contains the SQL schema definition for the **Airbnb Database** project.  
The schema includes tables for `users`, `properties`, `bookings`, `payments`, `reviews`, and `messages`.

## Files
- **schema.sql** → Contains the `CREATE TABLE` statements, indexes, and constraints.
- **README.md** → Documentation for this directory.

## Key Features
- UUIDs (`uuid_generate_v4()`) used as primary keys.
- Foreign keys with `ON DELETE CASCADE` to maintain referential integrity.
- ENUM-like constraints using `CHECK` (e.g., `role`, `status`, `payment_method`).
- Indexes added for:
  - Email (users)
  - Foreign keys (host_id, property_id, user_id, booking_id, etc.)
  - Searchable attributes (location, status, payment_method)

## How to Run
1. Ensure PostgreSQL is installed.
2. Enable UUID extension:
   ```sql
   CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
