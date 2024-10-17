create database aircraftDB0;
use aircraftDB0

create table aircraft(
aircraft_id int primary key,
tail_number varchar(50) comment 'unique aircraft ID on the tail of fuselage', 
model varchar(50),
capacity int
) comment = 'table contains information about aircrafts';

create table flights(
flight_id int primary key,
aircraft_id int,
airport_from varchar(50),
airport_to varchar(50),
departure_time date,
arrival_time date,
status enum('Scheduled', 'InAir', 'Landed', 'Canceled') not null,
foreign key (aircraft_id) references aircraft(aircraft_id) 
) comment = 'table contains information about flights';

create table passengers(
passenger_id int primary key,
first_name varchar(50),
last_name varchar(50),
date_of_birth date,
email varchar(50),
phone varchar(20),
pasport_number varchar(50),
check (phone regexp '^[+][0-9]{10,15}$' or phone regexp '^[0-9]{10,15}$')
-- ^ start of string, [+] the first element is '+', [0-9] numbers ony in range 0-9, {10,15} count of symvol, $ - end
) comment = 'table contains information about customers';

create table crew_members(
crew_member_id int primary key,
first_name varchar(50),
lastname varchar(50),
'role' enum('Pilot', 'Co-Pilot', 'Navigator', 'Flight Attendant') not null,
license_number varchar(90) comment 'pilot license',
email varchar(50),
phone varchar(20),
check (phone regexp '^[+][0-9]{10,15}$' or phone regexp '^[0-9]{10,15}$')
) comment = 'table contains information about employes';

create table bookings(
booking_id int primary key,
passenger_id int,
flight_id int,
seat_number varchar(20) comment 'after check-in',
booking_date date,
booking_status enum('Pending', 'Confirmed', 'Cancelled', 'Checked-in', 'Completed') not null,
foreign key (passenger_id) references passengers(passenger_id),
foreign key (flight_id) references flights(flight_id) 
) comment = 'table contains information about flight reservations';

create table flight_crew(
flight_id int,
crew_member_id int,
assignment_role enum('Pilot', 'Co-Pilot', 'Navigator', 'Flight Attendant') not null,
foreign key (flight_id) references flights(flight_id),
foreign key (crew_member_id) references crew_members(crew_member_id)
) comment = 'table contains information about crew serving specific flight';

create table incidents(
incident_id int primary key,
flight_id int,
incident_date date, 
description text,
reported_by int,
foreign key (flight_id) references flights(flight_id),
foreign key (reported_by) references crew_members(crew_member_id) 
) comment = 'table contains information about incidents';

create table incident_reports(
report_id int primary key,
incident_id int,
report_details text,
submitted_by int,
submitted_date date,
foreign key (incident_id) references incidents(incident_id),
foreign key (submitted_by) references crew_members(crew_member_id) 
) comment = 'table contains information about report for incident';
