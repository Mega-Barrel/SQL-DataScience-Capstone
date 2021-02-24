USE uc_davis;

-- iNSERTING RECORDS IN THE CITIES TABLE
INSERT INTO cities (city_name)
SELECT DISTINCT City
FROM athlete_events
GROUP BY City;


-- INSERTING RECORDS IN THE MEDALS TABLE
INSERT INTO medals (medal_type)
SELECT DISTINCT Medal
FROM athlete_events
GROUP BY Medal; 


-- INSERTING RECORDS IN THE SEASONS TABLE 
INSERT INTO seasons (season_name)
SELECT DISTINCT Season
FROM athlete_events;


-- INSERTING RECORDS IN THE GAMES TABLE
INSERT INTO games ( city_id, season_id, year )
SELECT c.city_id, s.season_id, a.year
FROM
    athlete_events a 
    INNER JOIN cities c ON a.City = c.city_name
    INNER JOIN seasons s ON a.Season = s.season_name;
    
    
-- INSERTING RECORDS IN THE SPORTS TABLE
INSERT INTO sports (season_id, sport_name)
SELECT s.season_id, a.Sport
FROM
	athlete_events a
	INNER JOIN seasons s ON a.Season = s.season_name;


-- INSERTING RECORDS IN THE EVENTS TABLE
INSERT INTO events (sport_id, event_name)
SELECT s.sport_id, a.Event
FROM
    athlete_events a
    INNER JOIN sports s ON a.Sport = s.sport_name;


-- INSERTING DATA INTO ATHLETES TABLE
INSERT INTO athletes (region_id, game_id, athlete_name, athlete_gender)
SELECT g.game_id
;


-- INSERTING RECORDS IN THE REGIONS TABLE
INSERT INTO regions (city_id, region_name, country_name)
SELECT c.city_id, co.NOC, co.region
FROM cities c, country co;


-- INSERTING RECORDS INTO TEAMS TABLE
INSERT INTO teams (region_id, team_name)
SELECT (
    (SELECT region_id FROM regions),
    (SELECT Team FROM athlete_events)
);


-- INSERTING DATA INTO Sports_Stats TABLE
INSERT INTO sports_stats (athlete_id, game_id, event_id, medal_id, athlete_age, athlete_height, athlete_weight)
SELECT (
    (SELECT athlete_id FROM athletes),
    (SELECT game_id FROM games),
    (SELECT event_id FROM events),
    (SELECT medal_id FROM medals),
    (SELECT Age, Height, Weight FROM athlete_events)
);