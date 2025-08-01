create database ola;
use Ola;

--  1. Retrieve all successful bookings:
create view Successful_bookings as
select *from bookings
where booking_Status = 'Success';
select * from Successful_bookings;

--  2. Find the average ride distance for each vehicle type:
create view average_ride_distance as
select Vehicle_Type,avg(Ride_Distance)
as avg_distance from bookings
group by Vehicle_Type;
select * from average_ride_distance;

--  3. Get the total number of cancelled rides by customers:
create view total_number_of_cancelled_rides_by_customers as
select count(*) from bookings
where booking_Status = 'Canceled by Customer';
select * from total_number_of_cancelled_rides_by_customers;

--  4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers_who_booked_the_highest_number_of_rides as
select Customer_ID,count(Booking_ID) as total_rides
from bookings
group by Customer_ID
Order by total_rides desc limit 5;
select * from top_5_customers_who_booked_the_highest_number_of_rides;

--  5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_drivers as
select count(*) from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';
select *from rides_cancelled_by_drivers;

--  6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view  max_min_driver_ratings_for_Prime_Sedan as
select max(Driver_ratings) as max_ratings,
min(Driver_ratings) as min_ratings 
from bookings where Vehicle_Type = 'Prime Sedan';
select * from max_min_driver_ratings_for_Prime_Sedan;

--  7. Retrieve all rides where payment was made using UPI:
create view payment_was_made_using_UPI as
select *from bookings 
where Payment_Method = 'UPI';
select *from payment_was_made_using_UPI;

--  8. Find the average customer rating per vehicle type:
create view average_customer_rating_per_vehicle as
select Vehicle_Type ,avg(Customer_rating) as Avg_Customer_rating
from bookings
group by  Vehicle_Type;
select *from average_customer_rating_per_vehicle;

--  9. Calculate the total booking value of rides completed successfully:
create view total_booking_value_of_rides_completed AS
select sum(Booking_value) as total_successful_value
from Bookings
where Booking_Status= 'Success';
select *from total_booking_value_of_rides_completed;

--  10. List all incomplete rides along with the reason
create view incomplete_rides_along_with_reason as
select Booking_ID ,Incomplete_Rides_Reason from Bookings
where Incomplete_Rides='Yes';
select * from incomplete_rides_along_with_reason;