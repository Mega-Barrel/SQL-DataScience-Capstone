USE uc_davis;

-- iNSERTING RECORDS IN THE CITIES TABLE
INSERT INTO cities (city_name)
SELECT City
FROM athlete_events
GROUP BY City;


-- INSERTING RECORDS IN THE SEASONS TABLE 
INSERT INTO seasons (season_name)
SELECT Season
FROM athlete_events;


-- INSERTING RECORDS IN THE REGIONS TABLE
INSERT INTO regions (city_id, region_name, country_name)
SELECT c.city_id, co.NOC, co.region
FROM cities c, country co;

-- INSERTING RECORDS IN THE GAMES TABLE
INSERT INTO games (city_id, season_id, year)
SELECT (
    (SELECT city_id FROM cities),
    (SELECT season_id FROM seasons),
    (SELECT Year FROM athlete_events)
);


-- INSERTING RECORDS IN THE SPORTS TABLE
INSERT INTO sports (season_id, sport_name)
SELECT (
    (SELECT season_id FROM seasons),
    (SELECT Sport FROM athlete_events)
);


-- INSERTING RECORDS IN THE EVENTS TABLE
INSERT INTO events (sport_id, event_name)
SELECT (
    (SELECT sport_id FROM sports),
    (SELECT Event FROM athlete_events)
);


-- INSERTING RECORDS INTO REGIONS TABLE
INSERT INTO regions (city_id, region_name, country_name)
SELECT (
    (SELECT city_id FROM cities),
    (SELECT NOC, region FROM regions)
);


-- INSERTING RECORDS INTO TEAMS TABLE
INSERT INTO teams (region_id, team_name)
SELECT (
    (SELECT region_id FROM regions),
    (SELECT Team FROM athlete_events)
);


-- INSERTING DATA INTO ATHLETES TABLE
INSERT INTO athletes (region_id, athlete_name, athlete_gender)
SELECT (
    (SELECT region_id FROM nocs),
    (SELECT Name, Sex FROM athlete_events)  
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