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
    INNER JOIN seasons s ON a.Season = s.season_name
GROUP BY c.city_id, s.season_id, a.year;
    
    
-- INSERTING RECORDS IN THE SPORTS TABLE
INSERT INTO sports (season_id, sport_name)
SELECT s.season_id, a.Sport
FROM
	athlete_events a
	INNER JOIN seasons s ON a.Season = s.season_name
GROUP BY s.season_id, a.Sport;


-- INSERTING RECORDS IN THE EVENTS TABLE
INSERT INTO events (sport_id, event_name)
SELECT DISTINCT s.sport_id, a.Event
FROM
    athlete_events a
    INNER JOIN sports s ON a.Sport = s.sport_name
GROUP BY s.sport_id, a.Event;


-- INSERTING RECORDS IN THE REGIONS TABLE
INSERT INTO regions (city_id, region_name, country_name)
SELECT DISTINCT c.city_id, a.NOC, co.region
	FROM cities c, athlete_events a
    INNER JOIN country co ON a.NOC = co.NOC
GROUP BY c.city_id, a.NOC, co.region;


-- INSERTING DATA INTO ATHLETES TABLE
INSERT INTO athletes (region_id, game_id, athlete_name, athlete_gender)
SELECT DISTINCT r.region_id, g.game_id, a.Name, a.SEX
	FROM athlete_events a
JOIN 	
	games g ON a.Year = g.year
JOIN 
	regions r ON a.NOC = r.region_name
GROUP by
	a.Name;


-- INSERTING RECORDS INTO TEAMS TABLE
INSERT INTO teams (region_id, team_name)
SELECT DISTINCT r.region_id, a.Team
	FROM athlete_events a
    INNER JOIN regions r ON a.NOC = r.region_name
GROUP BY r.region_id, a.Team;


-- INSERTING DATA INTO Sports_Stats TABLE
INSERT INTO sports_stats (athlete_id, game_id, event_id, medal_id, athlete_age, athlete_height, athlete_weight)
SELECT DISTINCT at.athlete_id, g.game_id, e.event_id, m.medal_id, a.Age, a.Height, a.Weight
	FROM athlete_events a
JOIN 
	medals m ON a.Medal = m.medal_type
JOIN
	events e ON a.Event = e.event_name
JOIN	
	games g ON a.Year = g.year
JOIN
	athletes at ON a.Sex = at.athlete_gender
GROUP BY a.Age;