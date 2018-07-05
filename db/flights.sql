-- Inserting queries...
drop table if exists Airport;
create table Airport(
    airportID int AUTO_INCREMENT primary key,
    airportName text
);

-- Mapping of From: Airport with To: Airport
drop table if exists Route;
create table Route (
    routeID int AUTO_INCREMENT primary key,
    depID int references Airport(airportID),
    arrID int references Airport(airportID)
);

drop table if exists Flights;
create table Flights(
    flightID int AUTO_INCREMENT primary key,
    flightName text,
    depTime time,
    arrTime time,
    time_duration time,
    depDate date,
    arrDate date,
    type text,
    price int,
    routeID int references Route(routeID)
    
);

drop table if exists Bookings;
create table Bookings(
    bookingID int AUTO_INCREMENT primary key,
    noOfPassengers int,
    flightID int references Flights(flightID)
);


insert into Flights(flightName, depTime, arrTime, time_duration, depDate, arrDate, type, price, routeID ) values ("FG-341", '20:30:00', '23:30:00', '03:00', '2018-07-11', '2018-07-11', "non-stop", 4200  1);
insert into Route(depID, arrID) values (1, 2);
insert into Airport(airportName) values ('DEL', 'BOM', 'BLR', 'MAA', 'CCU', 'HYD', 'COK');