-- capacity > 200
create view large_aircrafts as
select *
from aircraft
where aircraft.capacity > 200;

-- only pilot and co-pilot can have a license
update crew_members 
set license_number = Null
where `role` not in ('Pilot', 'Co-Pilot');

-- how many incidents recorded for each pilot
select crew_members.first_name, crew_members.lastname, count(*) as incident_count
from incidents
inner join flight_crew on incidents.flight_id = flight_crew.flight_id
inner join crew_members on flight_crew.crew_member_id = crew_members.crew_member_id
where flight_crew.assignment_role = 'Pilot'
group by crew_members.crew_member_id
order by incident_count desc;

-- crew in fligh 206831
create flight_ind on flight_crew(flight_id) -- make search by flight_id faster
select cm.first_name, cm.lastname, fc.assignment_role
from crew_members cm
inner join flight_crew fc on cm.crew_member_id = fc.crew_member_id
where fc.flight_id = '206831';

-- passengers in flight 206884
create booking_ind on booking(flight_id)
select p.first_name, p.last_name
from passengers p
inner join bookings b on p.passenger_id = b.passenger_id 
where b.flight_id = '206884';
