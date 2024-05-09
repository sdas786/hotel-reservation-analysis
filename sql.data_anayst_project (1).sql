#viewing the dataset
select * from hotel_resversation.`hotel reservation dataset`;

#DESCRIBE
describe hotel_resversation.`hotel reservation dataset`;

#correcting the dataset
set sql_safe_updates = 0;
update hotel_resversation.`hotel reservation dataset`
set arrival_date = str_to_date(arrival_date,'%Y-%m-%d');
alter table hotel_resversation.`hotel reservation dataset`
modify arrival_date date ;

#1. What is the total number of reservations in the dataset?
SELECT count(DISTINCT Booking_ID) FROM hotel_resversation.`hotel reservation dataset`;

#Which meal plan is the most popular among guests?
SELECT type_of_meal_plan,COUNT(type_of_meal_plan) FROM hotel_resversation.`hotel reservation dataset`
group by type_of_meal_plan
order by  type_of_meal_plan ;

#What is the average price per room for reservations involving children?
SELECT no_of_children,ROUND(avg(avg_price_per_room),2) FROM hotel_resversation.`hotel reservation dataset`
where no_of_children > 0 
group by no_of_children ;

#How many reservations were made for the year 20XX ?
select year(arrival_date)  as year , count(*) as total_reservations from  hotel_resversation.`hotel reservation dataset`
group by year(arrival_date)
order by year(arrival_date) asc ;

#What is the most commonly booked room type?
select room_type_reserved from hotel_resversation.`hotel reservation dataset`
group by room_type_reserved
order by room_type_reserved desc ;

#How many reservations fall on a weekend (no_of_weekend_nights > 0)?
select count(no_of_weekend_nights) from hotel_resversation.`hotel reservation dataset`
where no_of_weekend_nights > 0 ;

#What is the highest and lowest lead time for reservations?
select max(lead_time),min(lead_time) from hotel_resversation.`hotel reservation dataset`;

#What is the most common market segment type for reservations?
 select  market_segment_type from hotel_resversation.`hotel reservation dataset`
 group by market_segment_type 
 order by  market_segment_type desc ;

#How many reservations have a booking status of "Confirmed"?
select booking_status , count(booking_status) from hotel_resversation.`hotel reservation dataset`
group by booking_status
order by booking_status desc
limit 1;

#What is the total number of adults and children across all reservations?
select  sum( no_of_adults) , sum(no_of_children) from hotel_resversation.`hotel reservation dataset`;

#What is the average number of weekend nights for reservations involving children?
select round(AVG(no_of_weekend_nights,2)) as no_of_weekend_nights_for_childern  from hotel_resversation.`hotel reservation dataset`
WHERE no_of_children >0 ;

# How many reservations were made in each month of the year?
select count(month(arrival_date)),month(arrival_date) from hotel_resversation.`hotel reservation dataset`
group by month(arrival_date)
order by month(arrival_date) ;

#What is the average number of nights (both weekend and weekday) spent by guests for each room type ?
 
 select room_type_reserved , round(avg(no_of_week_nights+no_of_weekend_nights)) from hotel_resversation.`hotel reservation dataset`
 group by room_type_reserved 
 order by round(avg(no_of_week_nights+no_of_weekend_nights)) ;
 
 #For reservations involving children, what is the most common room type, and what is the average price for that room type?
select round(avg(avg_price_per_room),2), room_type_reserved from hotel_resversation.`hotel reservation dataset`
where no_of_children >0
group by room_type_reserved
order by round(avg(avg_price_per_room),2) ;

#Find the market segment type that generates the highest average price per room?
select market_segment_type ,round(avg(avg_price_per_room),2)from hotel_resversation.`hotel reservation dataset`
group by market_segment_type 
order by round(avg(avg_price_per_room),2) ;



