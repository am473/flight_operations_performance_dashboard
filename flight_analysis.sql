CREATE DATABASE flight_analysis;
USE flight_analysis;

CREATE TABLE cleaned_flights_data (
    id INT,
    Airline VARCHAR(10),
    Flight INT,
    AirportFrom VARCHAR(10),
    AirportTo VARCHAR(10),
    DayOfWeek INT,
    Time INT,
    Length INT,
    Delay INT
);

SELECT * FROM cleaned_flights_data LIMIT 10;

#Total Flights
SELECT COUNT(*) AS Total_Flights FROM cleaned_flights_data;

#Total Airlines
SELECT COUNT(DISTINCT Airline) AS Total_Airlines FROM cleaned_flights_data;

#Delay rate by Airlines
SELECT airline, AVG(Delay)*100 AS Delay_Rate
FROM cleaned_flights_data
GROUP BY Airline
ORDER BY Delay_Rate DESC;

#Delay Rate by Day
SELECT DayOfWeek, AVG(Delay)*100 AS Delay_Rate
FROM cleaned_flights_data
GROUP BY DayOfWeek
ORDER BY Delay_Rate DESC;

#Top 10 Departure Airports
SELECT AirportFrom, count(*) AS Total_Flights
FROM cleaned_flights_data
GROUP BY AirportFrom
ORDER BY Total_Flights DESC
LIMIT 10;

#Top 10 Arrival Airports
SELECT AirportTo, count(*) AS Total_Flights
FROM cleaned_flights_data
GROUP BY AirportTo
ORDER BY Total_Flights DESC
LIMIT 10;
