-- Using the uc_davis Database
USE uc_davis;

-- Displaying the total tables
SHOW TABLES;

SELECT DISTINCT * FROM country;

SELECT * FROM athlete_events LIMIT 20;

SELECT MIN(`Year`) FROM athlete_events;

SELECT MAX(`Year`) FROM athlete_events;


SELECT `Name`, COUNT(`Name`) AS `Participated_Events_Count`
FROM athlete_events
GROUP BY `Name`
ORDER BY COUNT(`Name`) DESC;



SELECT `Season`, COUNT(`Season`) AS `Total Seasons`
FROM athlete_events
GROUP BY `Season`
ORDER BY COUNT(`Season`) DESC;


SELECT `Sport`, COUNT(`Sport`) AS `Sports`
FROM athlete_events
GROUP BY `Sport`
ORDER BY COUNT(`Sport`) DESC;


SELECT DISTINCT(`Name`), `Team`
FROM athlete_events
GROUP BY `Name`
ORDER BY COUNT(`Team`) DESC LIMIT 30;


SELECT `Sex`, COUNT(DISTINCT(`Sex`)) AS `Gender` FROM athlete_events
GROUP BY `Sex`;


SELECT DISTINCT(`Name`), `Sex`, country.NOC, `Games`, `Year`
FROM country
INNER JOIN athlete_events
ON
country.NOC = athlete_events.NOC
WHERE athlete_events.NOC = 'USA'
AND `Sport` = 'Football';

