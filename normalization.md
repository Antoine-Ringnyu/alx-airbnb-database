# Database Normalization – Airbnb Database


✅ Review:
- **User**: Attributes (`first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`) all depend directly on `user_id`. No transitive dependency.
- **Property**: `name`, `description`, `location`, and `pricepernight` depend on `property_id`. `host_id` is a foreign key referencing `User`. No transitive dependency.
- **Booking**: `start_date`, `end_date`, `total_price`, and `status` depend on `booking_id`. `total_price` might seem derived from (`end_date - start_date`) * `pricepernight`, but keeping it stored avoids recalculations. This is a **denormalization choice** for performance, not a violation of 3NF since it depends on the booking itself.
- **Payment**: All attributes (`amount`, `payment_date`, `payment_method`) depend on `payment_id`. No transitive dependency.
- **Review**: `rating` and `comment` depend on `review_id`. No transitive dependency.
- **Message**: `sender_id`, `recipient_id`, and `message_body` depend on `message_id`. No transitive dependency.

**Status**: The schema satisfies 3NF.

---

## Conclusion
The database schema meets the requirements of **Third Normal Form (3NF)**.  
- No repeating groups (1NF).  
- No partial dependencies (2NF).  
- No transitive dependencies (3NF).  

The only **intentional denormalization** is the inclusion of `total_price` in `Booking`, which is justified for performance and data integrity.

