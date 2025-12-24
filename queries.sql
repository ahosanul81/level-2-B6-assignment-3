create database VehicleRentalSystem


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    role VARCHAR(20) NOT NULL CHECK (role IN ('admin', 'customer')),
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE vehicles (
    id SERIAL PRIMARY KEY,
    user_id int references users(id),
    vehicle_name VARCHAR(100) NOT NULL,
    vehicle_type VARCHAR(20) NOT NULL CHECK (vehicleType IN ('car', 'bike', 'truck')),
    model VARCHAR(50) NOT NULL,
    registration_number VARCHAR(50) NOT NULL UNIQUE,
    rental_price_per_day NUMERIC(10,2) NOT NULL CHECK (rentalPricePerDay > 0),
    availability_status VARCHAR(20) NOT NULL
        CHECK (availabilityStatus IN ('available', 'rented', 'maintenance')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id),
    vehicle_id INT NOT NULL REFERENCES vehicles(id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    booking_status VARCHAR(20) NOT NULL
        CHECK (bookingStatus IN ('pending', 'confirmed', 'completed', 'cancelled')),
    total_cost NUMERIC(10,2) NOT NULL CHECK (totalCost >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (end_date >= start_date)
);



INSERT INTO users (name, email, role, password, phone) VALUES
('Md. Rahim Uddin', 'rahim01@gmail.com', 'customer', 'hashed_pass_01', '01700000001'),
('Md. Karim Hossain', 'karim02@gmail.com', 'customer', 'hashed_pass_02', '01700000002'),
('Md. Hasan Ali', 'hasan03@gmail.com', 'customer', 'hashed_pass_03', '01700000003'),
('Md. Kamal Ahmed', 'kamal04@gmail.com', 'customer', 'hashed_pass_04', '01700000004'),
('Md. Shakil Mahmud', 'shakil05@gmail.com', 'customer', 'hashed_pass_05', '01700000005'),
('Md. Rakib Islam', 'rakib06@gmail.com', 'customer', 'hashed_pass_06', '01700000006'),
('Md. Imran Hossain', 'imran07@gmail.com', 'customer', 'hashed_pass_07', '01700000007'),
('Md. Saiful Islam', 'saiful08@gmail.com', 'customer', 'hashed_pass_08', '01700000008'),
('Md. Tanvir Ahmed', 'tanvir09@gmail.com', 'customer', 'hashed_pass_09', '01700000009'),
('Md. Mahmudul Hasan', 'mahmud10@gmail.com', 'customer', 'hashed_pass_10', '01700000010'),

('Md. Arif Hossain', 'arif11@gmail.com', 'customer', 'hashed_pass_11', '01700000011'),
('Md. Nazmul Islam', 'nazmul12@gmail.com', 'customer', 'hashed_pass_12', '01700000012'),
('Md. Rashed Khan', 'rashed13@gmail.com', 'customer', 'hashed_pass_13', '01700000013'),
('Md. Jahidul Islam', 'jahid14@gmail.com', 'customer', 'hashed_pass_14', '01700000014'),
('Md. Aminul Islam', 'amin15@gmail.com', 'customer', 'hashed_pass_15', '01700000015'),
('Md. Shafiul Alam', 'shafi16@gmail.com', 'customer', 'hashed_pass_16', '01700000016'),
('Md. Ashraful Islam', 'ashraf17@gmail.com', 'customer', 'hashed_pass_17', '01700000017'),
('Md. Faruk Hossain', 'faruk18@gmail.com', 'customer', 'hashed_pass_18', '01700000018'),
('Md. Monirul Islam', 'monir19@gmail.com', 'customer', 'hashed_pass_19', '01700000019'),
('Md. Sabbir Ahmed', 'sabbir20@gmail.com', 'customer', 'hashed_pass_20', '01700000020'),

('Md. Abdul Kader', 'kader21@gmail.com', 'customer', 'hashed_pass_21', '01700000021'),
('Md. Nurul Islam', 'nurul22@gmail.com', 'customer', 'hashed_pass_22', '01700000022'),
('Md. Shahadat Hossain', 'shahadat23@gmail.com', 'customer', 'hashed_pass_23', '01700000023'),
('Md. Mizanur Rahman', 'mizan24@gmail.com', 'customer', 'hashed_pass_24', '01700000024'),
('Md. Nazrul Islam', 'nazrul25@gmail.com', 'customer', 'hashed_pass_25', '01700000025'),
('Md. Golam Mostafa', 'mostafa26@gmail.com', 'customer', 'hashed_pass_26', '01700000026'),
('Md. Delwar Hossain', 'delwar27@gmail.com', 'customer', 'hashed_pass_27', '01700000027'),
('Md. Badrul Alam', 'badrul28@gmail.com', 'customer', 'hashed_pass_28', '01700000028'),
('Md. Sirajul Islam', 'siraj29@gmail.com', 'customer', 'hashed_pass_29', '01700000029'),
('Md. Jahangir Alam', 'jahangir30@gmail.com', 'customer', 'hashed_pass_30', '01700000030'),

('Md. Anwar Hossain', 'anwar31@gmail.com', 'customer', 'hashed_pass_31', '01700000031'),
('Md. Belal Hossain', 'belal32@gmail.com', 'customer', 'hashed_pass_32', '01700000032'),
('Md. Rafiq Uddin', 'rafiq33@gmail.com', 'customer', 'hashed_pass_33', '01700000033'),
('Md. Al-Amin', 'alamin34@gmail.com', 'customer', 'hashed_pass_34', '01700000034'),
('Md. Shamsul Haque', 'shamsul35@gmail.com', 'customer', 'hashed_pass_35', '01700000035'),

('Md. Kamruzzaman', 'admin01@gmail.com', 'admin', 'hashed_admin_01', '01800000001'),
('Md. Abdur Rahman', 'admin02@gmail.com', 'admin', 'hashed_admin_02', '01800000002'),
('Md. Fazlul Karim', 'admin03@gmail.com', 'admin', 'hashed_admin_03', '01800000003'),
('Md. Abdul Jalil', 'admin04@gmail.com', 'admin', 'hashed_admin_04', '01800000004'),
('Md. Abdul Mannan', 'admin05@gmail.com', 'admin', 'hashed_admin_05', '01800000005'),

('Md. Tareq Hasan', 'tareq41@gmail.com', 'customer', 'hashed_pass_41', '01700000041'),
('Md. Mehedi Hasan', 'mehedi42@gmail.com', 'customer', 'hashed_pass_42', '01700000042'),
('Md. Fahim Ahmed', 'fahim43@gmail.com', 'customer', 'hashed_pass_43', '01700000043'),
('Md. Riad Hossain', 'riad44@gmail.com', 'customer', 'hashed_pass_44', '01700000044'),
('Md. Sajjad Hossain', 'sajjad45@gmail.com', 'customer', 'hashed_pass_45', '01700000045'),

('Md. Sohel Rana', 'sohel46@gmail.com', 'customer', 'hashed_pass_46', '01700000046'),
('Md. Habibur Rahman', 'habib47@gmail.com', 'customer', 'hashed_pass_47', '01700000047'),
('Md. Mahbubur Rahman', 'mahbub48@gmail.com', 'customer', 'hashed_pass_48', '01700000048'),
('Md. Rezaul Karim', 'reza49@gmail.com', 'customer', 'hashed_pass_49', '01700000049'),
('Md. Ashikur Rahman', 'ashik50@gmail.com', 'customer', 'hashed_pass_50', '01700000050');

update users set password = '123456'

INSERT INTO vehicles (userId, vehicleName, vehicleType, model, registrationNumber, rentalPricePerDay, availabilityStatus)
VALUES
(1, 'Toyota Corolla', 'car', '2021', 'BD1001', 3000.00, 'available'),
(2, 'Honda Civic', 'car', '2020', 'BD1002', 3200.00, 'rented'),
(3, 'Suzuki Bike', 'bike', '2019', 'BD1003', 800.00, 'available'),
(4, 'Isuzu Truck', 'truck', '2022', 'BD1004', 5000.00, 'maintenance'),
(5, 'Nissan X-Trail', 'car', '2021', 'BD1005', 3500.00, 'available'),
(6, 'Mitsubishi L200', 'truck', '2020', 'BD1006', 4500.00, 'rented'),
(7, 'Yamaha FZ', 'bike', '2022', 'BD1007', 900.00, 'available'),
(8, 'Honda Accord', 'car', '2019', 'BD1008', 3100.00, 'available'),
(9, 'Toyota Hilux', 'truck', '2021', 'BD1009', 4800.00, 'maintenance'),
(10, 'Suzuki Gixxer', 'bike', '2021', 'BD1010', 850.00, 'available'),
(11, 'Hyundai Tucson', 'car', '2022', 'BD1011', 3400.00, 'available'),
(12, 'Ford Ranger', 'truck', '2021', 'BD1012', 4700.00, 'rented'),
(13, 'KTM Duke', 'bike', '2020', 'BD1013', 950.00, 'available'),
(14, 'BMW X5', 'car', '2020', 'BD1014', 5000.00, 'available'),
(15, 'Honda CR-V', 'car', '2021', 'BD1015', 3600.00, 'rented'),
(16, 'Suzuki Carry', 'truck', '2019', 'BD1016', 4000.00, 'available'),
(17, 'Yamaha R15', 'bike', '2022', 'BD1017', 1000.00, 'available'),
(18, 'Toyota Prius', 'car', '2020', 'BD1018', 3300.00, 'maintenance'),
(19, 'Mitsubishi Pajero', 'car', '2021', 'BD1019', 4200.00, 'available'),
(20, 'Isuzu D-Max', 'truck', '2022', 'BD1020', 4600.00, 'available'),
(21, 'Honda CBR', 'bike', '2021', 'BD1021', 950.00, 'rented'),
(22, 'Toyota RAV4', 'car', '2022', 'BD1022', 3700.00, 'available'),
(23, 'Ford F-150', 'truck', '2021', 'BD1023', 5000.00, 'available'),
(24, 'Suzuki Hayabusa', 'bike', '2020', 'BD1024', 1200.00, 'available'),
(25, 'Hyundai Creta', 'car', '2022', 'BD1025', 3200.00, 'rented'),
(26, 'Nissan Navara', 'truck', '2020', 'BD1026', 4500.00, 'maintenance'),
(27, 'KTM RC 390', 'bike', '2021', 'BD1027', 900.00, 'available'),
(28, 'BMW 3 Series', 'car', '2021', 'BD1028', 4800.00, 'available'),
(29, 'Honda Pilot', 'car', '2022', 'BD1029', 3900.00, 'rented'),
(30, 'Isuzu Elf', 'truck', '2019', 'BD1030', 4300.00, 'available'),
(31, 'Yamaha MT-15', 'bike', '2022', 'BD1031', 1000.00, 'available')
INSERT INTO vehicles (userId, vehicleName, vehicleType, model, registrationNumber, rentalPricePerDay, availabilityStatus)
VALUES (4, 'Toyota Camry', 'car', '2020', 'BD1032', 3500.00, 'available');

INSERT INTO bookings (user_id, vehicle_id, start_date, end_date, booking_status, total_cost)
VALUES
(1, 1, '2025-12-20', '2025-12-22', 'confirmed', 9000.00),
(3, 2, '2025-12-21', '2025-12-23', 'pending', 9600.00),
(5, 3, '2025-12-22', '2025-12-22', 'completed', 800.00),
(7, 4, '2025-12-23', '2025-12-25', 'cancelled', 15000.00),
(8, 5, '2025-12-24', '2025-12-26', 'confirmed', 10500.00),
(10, 6, '2025-12-25', '2025-12-25', 'pending', 4500.00),
(11, 7, '2025-12-26', '2025-12-28', 'completed', 2700.00),
(13, 8, '2025-12-27', '2025-12-29', 'confirmed', 9300.00),
(14, 9, '2025-12-28', '2025-12-30', 'pending', 14400.00),
(16, 10, '2025-12-29', '2025-12-31', 'completed', 2550.00);


INSERT INTO bookings (user_id, vehicle_id, start_date, end_date, booking_status, total_cost)
VALUES
(1, 1, '2025-12-26', '2025-12-30', 'confirmed', 9000.00),
(3, 9, '2025-12-26', '2025-12-29', 'pending', 9600.00);
delete from bookings
  select * from vehicles where availability_status = 'available'

-- Query 1: JOIN
-- Retrieve booking information along with:

-- Customer name
-- Vehicle name

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

-- Query 2: EXISTS
-- Requirement: Find all vehicles that have never been booked.

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


-- Query 3: WHERE
-- Requirement: Retrieve all available vehicles of a specific type (e.g. cars).

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


-- Query 4: GROUP BY and HAVING
-- Requirement: Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.

select 
  vehicles.vehicle_name, count(bookings.vehicle_id) as total_booking
  from bookings 
  join vehicles on vehicles.id = bookings.vehicle_id 
  group by vehicles.id
having count(bookings.vehicle_id) > 2

