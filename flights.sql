/*flights.sql*/
SELECT
    *
FROM
    USAirlineFlights.flights;

/*Quantitat de registres de la taula de vols:*/
SELECT
    COUNT(*)
FROM
    USAirlineFlights.flights;

/*Retard promig de sortida i arribada segons l’aeroport origen.*/
SELECT
    ArrDelay,
    DepDelay
FROM
    USAirlineFlights.flights;

/*Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen. A més, volen que els resultat es mostrin de la següent forma (fixa’t en l’ordre de les files):*/
SELECT
    Origin,
    colYear,
    colMonth,
    AVG(ArrDelay) AS prom_arribades
FROM
    USAirlineFlights.flights
GROUP BY
    Origin,
    colYear,
    colMonth
ORDER BY
    colYear ASC,
    Origin ASC,
    colMonth ASC;

/*Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen (mateixa consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat.*/
SELECT
    airports.City,
    flights.colYear,
    flights.colMonth,
    AVG(flights.ArrDelay) AS prom_arribades
FROM
    USAirlineFlights.flights 
    LEFT JOIN airports ON airports.iata = flights.Origin
GROUP BY
    airports.City,
    flights.colYear,
    flights.colMonth
ORDER BY
    airports.City ASC,
    flights.colYear ASC,
    flights.colMonth ASC;

/*
 SELECT
 airports.City,
 flights.colYear,
 flights.colMonth,
 AVG(flights.ArrDelay) AS prom_arribades
 FROM flights --taula principal
 LEFT JOIN airports --amb quina ytaula ho vull unir
 ON airports.iata = flights.Origin --punt d'unió
 GROUP BY
 airports.City,
 flights.colYear,
 flights.colMonth
 ORDER BY
 airports.City ASC,
 flights.colYear ASC,
 flights.colMonth ASC;
 */
/*Les companyies amb més vols cancelats, per mesos i any. A més, han d’estar ordenades de forma que les companyies amb més cancel·lacions apareguin les primeres.*/
SELECT
    UniqueCarrier,
    colYear,
    colMonth,
    SUM(Cancelled) AS total_cancelled
FROM
    USAirlineFlights.flights
GROUP BY
    UniqueCarrier,
    colYear,
    colMonth,
    Cancelled
ORDER BY
    total_cancelled DESC;

/*L’identificador dels 10 avions que més distància han recorregut fent vols.*/
SELECT
    TailNum,
    SUM(Distance) AS total_distance
FROM
    USAirlineFlights.flights
WHERE
    TailNum LIKE 'N%' -- les dades de la columna seleccionada que comencen en N
GROUP BY
    TailNum
ORDER BY
    total_distance DESC
LIMIT
    10; -- màxim de 10 resultats (files)

/*Companyies amb el seu retard promig només d’aquelles les quals els seus vols arriben al seu destí amb un retràs promig major de 10 minuts.*/
SELECT
    UniqueCarrier,
    AVG(ArrDelay) AS avgDelay
FROM
    USAirlineFlights.flights
GROUP BY
    UniqueCarrier
HAVING --En consultes d'agrupació, enlloc de la clàusula WHERE s'utilitza HAVING
    AVG(ArrDelay) > 10 
ORDER BY
    avgDelay DESC;