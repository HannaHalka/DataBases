create table crew (
    personal_id int not null auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    role_in_crew varchar(50),
    primary key (personal_id)
);

insert into crew (first_name, last_name, role_in_crew)
values
('Ivan', 'Kozhedub', 'capitan'),
('Ethan', 'Harper', 'first officer'),
('Oliver', 'Bennett', 'navigator'),
('Emma', 'Caldwell', 'flight attendant'),
('lily', 'Thompson', 'flight attendant'),
( 'Jack', 'Preston', 'flight attendant'),
('Sophie', 'Brooks', 'capitan'),
('Henry', 'Mitchell', 'first officer'),
('Grace', 'Donivan', 'navigator'),
('James', 'Fletcher', 'flight attendant'),
('Ava', 'Collins', 'flight attendant'),
('Harry', 'Potter', 'flight attendant');

create table passengers (
    passenger_id int not null auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    age int,
    primary key (passenger_id)
);

insert into passengers (first_name, last_name, age)
values
('Abe', 'Simpson', 98),
('Moe', 'Szyslak', 44),
('Ned', 'Flanders', 5),
('Homer', 'Simpson', 35),
('Marge', 'Simpson', 34),
('Bart', 'Simpson', 12),
('Lisa', 'Simpson', 10),
('Maggie', 'Simpson', 2),
('Milhouse', 'Van Houten', 30),
('MR.', 'Burns', 24),
('Krusty', 'Clown', 25),
('Chief', 'Wiggum', 42),
('luffy', 'Monkey', 20),
('Buggy', 'Clown', 41),
('Carl', 'Carlson', 21),
('Lenny', 'Leonard', 34),
('Law', 'Trafalgar', 35),
('Apu', 'Nahasapeemapetilon', 36),
('Seymour', 'Skinner', 41),
('Enda', 'Krabappel', 29),
('Barney', 'Gumble', 20),
('Mattew', 'Macfadien', 24),
('Tom', 'Holland', 25),
('Alice', 'Cooper', 27);

create table aircrafts (
    aircraft_id int not null auto_increment,
    model varchar(50),
    year_of_make date, 
    primary key (aircraft_id)
);

insert into aircrafts (model, year_of_make)
values
('Boing 737', '2019-11-12'),
('AirBus A320', '2018-5-23'),
('Boing 737', '2019-2-9'),
('AirBus A320', '2018-1-30'),
('Boing 737', '2019-12-10');

create table aircraft_maintenance (
	aircraft_id int,
	routine_maintenance date, -- once in 1-2 year
	line_maintenance date, -- after each flight
	foreign key (aircraft_id) references aircrafts(aircraft_id)
);

insert into aircraft_maintenance (aircraft_id, routine_maintenance, line_maintenance)
values
(1, '2021-01-12', '2021-01-19'), 
(1, null, '2021-05-29'),
(1, null, '2022-11-02'),
(1, '2023-11-12', '2024-01-12'),
(1, null, '2024-10-02'),
(2, '2021-01-12', '2021-01-19'), 
(2, null, '2021-05-29'),
(2, null, '2022-11-02'),
(2, '2023-11-12', '2024-01-12'),
(2, null, '2024-10-02'),
(3, '2021-01-12', '2021-01-19'), 
(3, null, '2021-05-29'),
(3, null, '2022-11-02'),
(3, '2023-11-12', '2024-01-12'),
(3, null, '2024-10-02'),
(4, '2021-01-12', '2021-01-19'), 
(4, null, '2021-05-29'),
(4, null, '2022-11-02'),
(4, '2023-11-12', '2024-01-12'),
(4, null, '2024-10-02'),
(5, '2021-01-12', '2021-01-19'), 
(5, null, '2021-05-29'),
(5, null, '2022-11-02'),
(5, '2023-11-12', '2024-01-12'),
(5, null, '2024-10-02');

create table flights (
flight_id int not null auto_increment,
aircraft_id int,
airport_from varchar(50),
airport_to varchar(50),
date_of_flight date,
foreign key (aircraft_id) references aircrafts(aircraft_id),
primary key (flight_id)
);

insert into flights (aircraft_id, date_of_flight, airport_from, airport_to)
values
(1, '2024-11-21', 'LHR', 'VIE'), -- from Heathrow Airport (London) to Viena international Airport (Austria)
(4, '2024-11-27', 'VIE', 'LHR'); -- from Viena international Airport (Austria) to Heathrow Airport (London)

create table flight_passengers (
	flight_id int,
	personal_id int,
    passenger_id int,
    foreign key (flight_id) references flights(flight_id),
    foreign key (personal_id) references crew(personal_id),
	foreign key (passenger_id) references passengers(passenger_id)
);

insert into flight_passengers (flight_id, personal_id, passenger_id)
values
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(1, 4, 4),
(1, 5, 5),
(1, 6, 6),
(1, null, 7),
(1, null, 8),
(1, null, 9),
(1, null, 10),
(1, null, 11),
(1, null, 12),
(2, 7, 13),
(2, 8, 14),
(2, 9, 15),
(2, 10, 16),
(2, 11, 17),
(2, 12, 18),
(2, null, 19),
(2, null, 20),
(2, null, 21),
(2, null, 22),
(2, null, 23),
(2, null, 24);

create table flight_incedents (
	incedents_id int not null auto_increment,
	flight_id int,
	incident_date date,
    foreign key (flight_id) references flights(flight_id),
    primary key (incedents_id) 
);

insert into flight_incedents (flight_id, incident_date)
values
(2, '2024-11-27');

create table incident_passengers (
	incedents_id int,
	passenger_id int,
	personal_id int,
	foreign key (incedents_id) references flight_incedents(incedents_id),
	foreign key (passenger_id) references passengers(passenger_id),
	foreign key (personal_id) references crew(personal_id)
);

insert into incident_passengers (incedents_id, passenger_id, personal_id)
values
(1, 13, 7),
(1, 14, 8),
(1, 15, 9),
(1, 16, 10),
(1, 17, 11),
(1, 18, 12),
(1, 19, null),
(1, 20, null),
(1, 21, null),
(1, 22, null),
(1, 23, null),
(1, 24, null);

create table passenger_compensation (
	incedents_id int,
	passenger_id int,
	amount_dollar decimal,
	date_of_payment date,
	foreign key (incedents_id) references flight_incedents(incedents_id),
	foreign key (passenger_id) references passengers(passenger_id)
);
	
insert into passenger_compensation (incedents_id, passenger_id, amount_dollar, date_of_payment)
values
(1, 13, 1000, '2024-11-27)'),
(1, 14, 1000, '2024-11-27)'),
(1, 15, 1100, '2024-11-27)'),
(1, 16, 1100, '2024-11-27)'),
(1, 17, 800, null),
(1, 18, 900, null),
(1, 19, 1300, null),
(1, 20, 950, '2024-11-27)'),
(1, 21, 1050, '2024-11-27)'),
(1, 22, 1000, null),
(1, 23, 1010, null),
(1, 24, 1120, null);

-- joining 

select passengers.first_name, passengers.last_name, passenger_compensation.amount_dollar, 
		flights.airport_from, flights.airport_to, crew.first_name, crew.last_name,
		crew.role_in_crew, passenger_compensation.date_of_payment
from flight_incedents 
right join incident_passengers on flight_incedents.incedents_id = incident_passengers.incedents_id
left join passengers on incident_passengers.passenger_id = passengers.passenger_id
left join passenger_compensation on passengers.passenger_id = passenger_compensation.passenger_id
left join crew on incident_passengers.personal_id = crew.personal_id 
left join flights on flight_incedents.flight_id = flights.flight_id
where passenger_compensation.date_of_payment is null -- we will see all people who didn`t get their compensation
order by amount_dollar;
