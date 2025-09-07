# Airbnb Database Seed Data

## Overview
This directory contains SQL scripts to populate the **Airbnb Database** with **sample data**.  
The sample entries reflect realistic usage of the platform: multiple users, hosts, properties, bookings, payments, reviews, and messages.

## Files
- **seed.sql** → SQL `INSERT` statements for seeding sample data.
- **README.md** → Documentation for this directory.

## How to Run
1. Make sure you already created the schema (`schema.sql` in `database-script-0x01`).
2. Connect to your PostgreSQL database.
3. Run the seed script:
   ```bash
   psql -U your_username -d your_database -f seed.sql
