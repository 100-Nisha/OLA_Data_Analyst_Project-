CREATE DATABASE OLA;

USE OLA;

 #1. Retrieve all successful bookings:
 CREATE VIEW Successful_bookings AS
 SELECT * FROM bookings 
 WHERE Booking_Status = 'Success';
 
 SELECT * FROM Successful_bookings;
 
 #2. Find the average ride distance for each vehicle type:
 create view ride_distance_for_each_vehical as
 SELECT Vehicle_Type, avg(Ride_Distance)
 AS avg_distance FROM bookings
 GROUP BY Vehicle_Type;
 
 select * from ride_distance_for_each_vehical;
 
 #3. Get the total number of cancelled rides by customers:
 create view cancelled_rides_by_customers as
 select count(*) from bookings
 where Booking_Status = 'Canceled by Driver';
 
 select * from cancelled_rides_by_customers;
 
 #4. List the top 5 customers who booked the highest number of rides:
 CREATE VIEW top_5_Customer as
 select Customer_ID, count(Booking_ID) as total_ride
 from bookings
 group by Customer_ID
 order by total_ride DESC LIMIT 5;
 
 select * from top_5_Customer;
 
 #5. Get the number of rides cancelled by drivers due to personal and car-related issuesPersonal & Car related issue:
 create view canceled_by_driver_p_c_essue as
 select count(*) from bookings where Canceled_Rides_by_Driver = 'Personal & Car related issue';
 
 select * from canceled_by_driver_p_c_essue;
 
 #6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 create view max_min_driver_rating as 
 select max(Driver_Ratings) as max_rating,
 min(Driver_Ratings) as min_rating from bookings
 where Vehicle_Type ='Prime Sedan';
 
 select * from max_min_driver_rating;
 
 #7. Retrieve all rides where payment was made using UPI:
 create view pay_mode_upi as
 select * from bookings
 where Payment_Method = 'UPI';
 
 select * from pay_mode_upi;
 
 #8. Find the average customer rating per vehicle type:
 create view avg_customer_rating as
 select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating from bookings
 group by Vehicle_Type;
 
 select * from avg_customer_rating;
 
 #9. Calculate the total booking value of rides completed successfully:
 create view total_booking_value_ride_comp_success as
 select sum(Booking_Value) as total_successful_value from bookings 
 where Booking_Status = 'Success';
 
 select * from total_booking_value_ride_comp_success;
 
 #10. List all incomplete rides along with the reason:
 create view list_incomplete_ride as
 select Booking_ID, Incomplete_Rides_Reason from bookings
 where Incomplete_Rides = 'Yes';
 
 select * from list_incomplete_ride;
 