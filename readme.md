### Vehicle Rental System

This document contains example SQL queries used in the Vehicle Booking System database.
Each query demonstrates a core SQL concept with a clear requirement and solution.

# Query 1: JOIN

Requirement

Retrieve booking information along with:

- **Booking ID**
- **Customer Name**
- **Vehicle Details**
  - Name
  - Type
  - Model
  - Registration Number
  - Rental Price per Day
  - Availability Status

----------Solution--------------------

We use INNER JOIN to combine data from bookings, users, and vehicles tables.

```sql
select
  bookings.id as booking_id,
  users.name as customer_nname,
  vehicles.id, vehicles.vehicle_name,
  vehicles.vehicle_type,
  vehicles.model,
  vehicles.registration_number,
  vehicles.rental_price_per_day,
  vehicles.availability_status as status
from bookings inner join users on users.id = bookings.user_id
inner join vehicles on vehicles.id = bookings.vehicle_id;
```

# Query 2: EXISTS

Requirement

-**Find all vehicles that have never been booked.**

-----------------Solution------------------------

We use NOT EXISTS to check vehicles that do not appear in the bookings table.

```sql
select
  id as vehicle_id,
  vehicle_name,
  vehicle_type,
  model,
  registration_number,
  rental_price_per_day,
  availability_status
from vehicles
where availability_status  <> 'rented'
```

# Query 3: WHERE

Requirement

- Retrieve all available vehicles of a specific type (example: car).

-------------------Solution--------------------

```sql
select
  id as vehicle_id,
  vehicle_name,
  vehicle_type,
  model,
  registration_number,
  rental_price_per_day,
  availability_status
from vehicles
where availability_status = 'available' and vehicle_type = 'car';
```

- We use the WHERE clause with multiple conditions.

# Query 4: GROUP BY and HAVING

Requirement

- **Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.**

------------------Solution---------------------

```sql
select
  vehicles.vehicle_name, count(bookings.vehicle_id) as total_booking
from bookings
join vehicles on vehicles.id = bookings.vehicle_id
group by vehicles.id
having count(bookings.vehicle_id) > 2
```

We use:

GROUP BY to group bookings per vehicle

HAVING to filter grouped results
