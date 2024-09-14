CREATE TABLE crew (
    person_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    role_in_crew VARCHAR(50)
);

INSERT INTO crew (person_id, first_name, last_name, role_in_crew)
VALUES
(1, 'Ivan', 'Kozhedub', 'capitan'),
(2, 'Ethan', 'Harper', 'first officer'),
(3, 'Oliver', 'Bennett', 'navigator'),
(4, 'Emma', 'Caldwell', 'flight attendant'),
(5, 'lily', 'Thompson', 'flight attendant'),
(6, 'Jack', 'Preston', 'flight attendant'),
(7, 'Sophie', 'Brooks', 'capitan'),
(8, 'Henry', 'Mitchell', 'first officer'),
(9, 'Grace', 'Donivan', 'navigator'),
(10, 'James', 'Fletcher', 'flight attendant'),
(11, 'Ava', 'Collins', 'flight attendant'),
(12, 'Harry', 'Potter', 'flight attendant');

CREATE TABLE passengers (
    passenger_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT
);

INSERT INTO passengers (passenger_id, first_name, last_name, age)
VALUES
(1, 'Abe', 'Simpson', 98),
(2, 'Moe', 'Szyslak', 44),
(3, 'Ned', 'Flanders', 5),
(4, 'Homer', 'Simpson', 35),
(5, 'Marge', 'Simpson', 34),
(6, 'Bart', 'Simpson', 12),
(7, 'Lisa', 'Simpson', 10),
(8, 'Maggie', 'Simpson', 2),
(9, 'Milhouse', 'Van Houten', 30),
(10, 'MR.', 'Burns', 24),
(11, 'Krusty', 'Clown', 25),
(12, 'Chief', 'Wiggum', 42),
(13, 'luffy', 'Monkey', 20),
(14, 'Buggy', 'Clown', 41),
(15, 'Carl', 'Carlson', 21),
(16, 'Lenny', 'Leonard', 34),
(17, 'Law', 'Trafalgar', 35),
(18, 'Apu', 'Nahasapeemapetilon', 36),
(19, 'Seymour', 'Skinner', 41),
(20, 'Enda', 'Krabappel', 29),
(21, 'Barney', 'Gumble', 20),
(22, 'Mattew', 'Macfadien', 24),
(23, 'Tom', 'Holland', 25),
(24, 'Alice', 'Cooper', 27);

CREATE TABLE aircrafts (
    aircraft_id INT PRIMARY KEY,
    model VARCHAR(50),
    year_of_make DATE
);

INSERT INTO aircrafts (aircraft_id, model, year_of_make)
VALUES
(1, 'Boing 737', '2019-11-12'),
(2, 'AirBus A320', '2018-5-23'),
(3, 'Boing 737', '2019-2-9'),
(4, 'AirBus A320', '2018-1-30'),
(5, 'Boing 737', '2019-12-10');

CREATE TABLE aircraft_maintencence (
	aircraft_id INT,
	routine_maintencence DATE, -- once in 1-2 year
	line_maintencence DATE, -- after each flight
	FOREIGN KEY (aircraft_id) REFERENCES aircrafts(aircraft_id)
);

INSERT INTO aircraft_maintencence (aircraft_id, routine_maintencence, line_maintencence)
VALUES
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

CREATE TABLE flights (
	flight_id INT,
	aircraft_id INT,
	person_id INT,
    passenger_id INT,
    date_of_flight DATE,
    airport_from VARCHAR(50),
    airport_to VARCHAR(50),
	FOREIGN KEY (aircraft_id) REFERENCES aircrafts(aircraft_id),
    FOREIGN KEY (person_id) REFERENCES crew(person_id),
	FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id)
);

INSERT INTO flights (flight_id, aircraft_id, person_id, passenger_id, date_of_flight, airport_from, airport_to)
VALUES
(1, 1, 1, 1, '2024-11-21', 'LHR', 'VIE'), -- from Heathrow Airport (London) to Viena international Airport (Austria)
(1, 1, 2, 2, '2024-11-21', 'LHR', 'VIE'),
(1, 1, 3, 3, '2024-11-21', 'LHR', 'VIE'),
(1, 1, 4, 4, '2024-11-21', 'LHR', 'VIE'),
(1, 1, 5, 5, '2024-11-21', 'LHR', 'VIE'),
(1, 1, 6, 6, '2024-11-21', 'LHR', 'VIE'),
(1, 1, null, 7, '2024-11-21', 'LHR', 'VIE'),
(1, 1, null, 8, '2024-11-21', 'LHR', 'VIE'),
(1, 1, null, 9, '2024-11-21', 'LHR', 'VIE'),
(1, 1, null, 10, '2024-11-21', 'LHR', 'VIE'),
(1, 1, null, 11, '2024-11-21', 'LHR', 'VIE'),
(1, 1, null, 12, '2024-11-21', 'LHR', 'VIE'),
(2, 4, 7, 13, '2024-11-27', 'VIE', 'LHR'), -- from Viena international Airport (Austria) to Heathrow Airport (London)
(2, 4, 8, 14, '2024-11-27', 'VIE', 'LHR'),
(2, 4, 9, 15, '2024-11-27', 'VIE', 'LHR'),
(2, 4, 10, 16, '2024-11-27', 'VIE', 'LHR'),
(2, 4, 11, 17, '2024-11-27', 'VIE', 'LHR'),
(2, 4, 12, 18, '2024-11-27', 'VIE', 'LHR'),
(2, 4, null, 19, '2024-11-27', 'VIE', 'LHR'),
(2, 4, null, 20, '2024-11-27', 'VIE', 'LHR'),
(2, 4, null, 21, '2024-11-27', 'VIE', 'LHR'),
(2, 4, null, 22, '2024-11-27', 'VIE', 'LHR'),
(2, 4, null, 23, '2024-11-27', 'VIE', 'LHR'),
(2, 4, null, 24, '2024-11-27', 'VIE', 'LHR');

-- joining 



