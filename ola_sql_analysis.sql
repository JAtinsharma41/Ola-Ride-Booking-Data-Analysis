-- Create Database
CREATE DATABASE ola;
USE ola;

-- View all data
SELECT * FROM ola_bookings;

----------------------------------------------------
-- Data Cleaning
----------------------------------------------------

ALTER TABLE ola_bookings
DROP COLUMN column21;

ALTER TABLE ola_bookings
DROP COLUMN Vehicle_Images;

----------------------------------------------------
-- 1 Retrieve all successful bookings
----------------------------------------------------
go
CREATE VIEW retrieve_success_bookings AS
SELECT *
FROM ola_bookings
WHERE Booking_Status = 'Success';
go
SELECT *
FROM retrieve_success_bookings;

----------------------------------------------------
-- 2 Average ride distance for each vehicle type
----------------------------------------------------

SELECT Vehicle_Type,
AVG(Ride_Distance) AS avg_ride_distance
FROM ola_bookings
GROUP BY Vehicle_Type;

----------------------------------------------------
-- 3 Total cancelled rides by customers
----------------------------------------------------

SELECT COUNT(*) AS total_customer_cancellations
FROM ola_bookings
WHERE Booking_Status = 'Cancelled by Customer';

----------------------------------------------------
-- 4 Top 5 customers with highest bookings
----------------------------------------------------

SELECT TOP 5 Customer_ID,
COUNT(Booking_ID) AS total_rides
FROM ola_bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC;

----------------------------------------------------
-- 5 Driver cancellations due to personal/car issues
----------------------------------------------------

SELECT COUNT(*) AS driver_cancellations
FROM ola_bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issues';

----------------------------------------------------
-- 6 Max and Min driver rating for Prime Sedan
----------------------------------------------------

SELECT 
MAX(Driver_Ratings) AS max_rating,
MIN(Driver_Ratings) AS min_rating
FROM ola_bookings
WHERE Vehicle_Type = 'Prime Sedan';

----------------------------------------------------
-- 7 Rides paid using UPI
----------------------------------------------------

SELECT COUNT(*) AS total_upi_rides
FROM ola_bookings
WHERE Payment_Method = 'UPI';

----------------------------------------------------
-- 8 Average customer rating per vehicle type
----------------------------------------------------

SELECT Vehicle_Type,
AVG(Customer_Rating) AS avg_customer_rating
FROM ola_bookings
GROUP BY Vehicle_Type;

----------------------------------------------------
-- 9 Total booking value of successful rides
----------------------------------------------------

SELECT SUM(Booking_Value) AS total_revenue
FROM ola_bookings
WHERE Booking_Status = 'Success';

----------------------------------------------------
-- 10 Incomplete rides with reason
----------------------------------------------------

SELECT Booking_ID,
Incomplete_Rides_Reason
FROM ola_bookings
WHERE Incomplete_Rides = 1;

----------------------------------------------------
-- 11 Most used vehicle type
----------------------------------------------------

SELECT TOP 1 Vehicle_Type,
COUNT(*) AS total_rides
FROM ola_bookings
WHERE Booking_Status = 'Success'
GROUP BY Vehicle_Type
ORDER BY total_rides DESC;

----------------------------------------------------
-- 12 Average ride distance
----------------------------------------------------

SELECT AVG(Ride_Distance) AS avg_ride_distance
FROM ola_bookings;

----------------------------------------------------
-- 13 Highest booking value
----------------------------------------------------

SELECT MAX(Booking_Value) AS highest_booking_value
FROM ola_bookings;

----------------------------------------------------
-- 14 Lowest driver rating
----------------------------------------------------

SELECT MIN(Driver_Ratings) AS lowest_driver_rating
FROM ola_bookings;

----------------------------------------------------
-- 15 Vehicle wise average booking value
----------------------------------------------------

SELECT Vehicle_Type,
AVG(Booking_Value) AS avg_booking_value
FROM ola_bookings
GROUP BY Vehicle_Type
ORDER BY avg_booking_value DESC;

----------------------------------------------------
-- 16 Driver cancellation reasons
----------------------------------------------------

SELECT distinct Canceled_Rides_by_Driver
FROM ola_bookings
GROUP BY Canceled_Rides_by_Driver
