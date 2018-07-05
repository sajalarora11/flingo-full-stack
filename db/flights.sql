-- Inserting queries...

drop table if not exists Airport;
create table Airport(
    airportID int AUTO_INCREMENT primary key,
    airportName text
);

-- Mapping of From: Airport with To: Airport
drop table if not exists Route;
create table Route(
    routeID AUTO_INCREMENT not null primary key,
    depID int,
    arrID int,
    foriegn key(depID) references Airport(airportID),
    foriegn key(arrID) references Airport(airportID)
);

drop table if not exists Fligts;
create table Flights(
    flightID AUTO_INCREMENT not null primary key,
    flightName text,
    depTime time,
    arrTime time,
    time_duration time,
    depDate date,
    arrDate date,
    type text,
    price int,
    routeID int,
    foriegn key(routeID) references Route(routeID)
    
);

insert into Flights(flightName, depTime, arrTime, time_duration, depDate, arrDate, type, price, routeID ) values ("FG-341", '20:30:00', '23:30:00', '03:00', '2018-07-11', '2018-07-11', "non-stop", 4200  1);
insert into Route(depID, arrID) values (1, 2);
insert into Airport(airportName) values ('DEL', 'BOM', 'BLR', 'MAA', 'CCU', 'HYD', 'COK');