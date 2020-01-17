/*flights.sql*/
SELECT * FROM USAirlineFlights.flights;

/*Quantitat de registres de la taula de vols:*/
SELECT COUNT(*) FROM USAirlineFlights.flights;

/*Retard promig de sortida i arribada segons l’aeroport origen.*/
SELECT ArrDelay, DepDelay FROM USAirlineFlights.flights;

/*Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen. A més, volen que els resultat es mostrin de la següent forma (fixa’t en l’ordre de les files):*/
SELECT Origin, colYear, colMonth, AVG(ArrDelay) AS prom_arribades FROM USAirlineFlights.flights GROUP BY Origin, colYear, colMonth ORDER BY colYear ASC, Origin ASC, colMonth ASC;

/*Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen (mateixa consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat.*/
SELECT airports.Origin, airports.colYear, airports.colMonth, AVG(airports.ArrDelay) AS prom_arribades, airportsdetail.city FROM USAirlineFlights.flights LEFT JOIN city.airportsdetail AS City ON airports.Origin = airportsdetail.city GROUP BY airports.city, airports.colYear, airports.colMonth ORDER BY airports.colYear ASC, details.city ASC, airports.colMonth ASC;

SELECT airportsdetail.city AS City, airports.colYear, airports.colMonth, AVG(airports.ArrDelay) AS prom_arribades FROM USAirlineFlights.flights LEFT JOIN city.airportsdetail ON airports.Origin = airportsdetail.city GROUP BY airports.city, airports.colYear, airports.colMonth ORDER BY airports.colYear ASC, details.city ASC, airports.colMonth ASC;