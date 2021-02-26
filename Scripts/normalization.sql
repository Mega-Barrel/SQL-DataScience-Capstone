-- Creating the Database
CREATE DATABASE IF NOT EXISTS uc_davis;

-- DATABASE NAME
USE uc_davis;

DROP TABLE sports_stats, medals, seasons, cities, events, sports, games, athletes, regions, teams;

-- MAIN TABLE
CREATE TABLE IF NOT EXISTS sports_stats (
    sports_stats_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    athlete_id INT,
    game_id INT,
    event_id INT,
    medal_id INT,
    athlete_age INT,
    athlete_height INT,
    athlete_weight INT,
    
    FOREIGN KEY (athlete_id) REFERENCES athletes(athlete_id),
    FOREIGN KEY (game_id) REFERENCES games(game_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id),
	FOREIGN KEY (medal_id) REFERENCES medals(medal_id) 
);


-- MEDAL TABLE
CREATE TABLE IF NOT EXISTS medals (
    medal_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    medal_type VARCHAR(100)
);


-- SEASONS TABLE
CREATE TABLE IF NOT EXISTS seasons (
    season_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    season_name VARCHAR(100)
);


-- CITIES TABLE
CREATE TABLE IF NOT EXISTS cities (
    city_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    city_name VARCHAR(100)
);


-- SPORTS TABLE
CREATE TABLE IF NOT EXISTS sports (
    sport_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    season_id INT,
    sport_name VARCHAR(100),
    FOREIGN KEY (season_id)
        REFERENCES seasons (season_id)
);


-- EVENTS TABLE
CREATE TABLE IF NOT EXISTS events (
    event_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sport_id INT,
    event_name VARCHAR(100),
    FOREIGN KEY (sport_id)
        REFERENCES sports (sport_id)
);


-- GAME TABLE
CREATE TABLE IF NOT EXISTS games (
    game_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    city_id INT,
    season_id INT,
    year INT,
    FOREIGN KEY (season_id)
        REFERENCES seasons (season_id),

    FOREIGN KEY (city_id)
        REFERENCES cities (city_id)
);


-- REGIONS TABLE
CREATE TABLE IF NOT EXISTS regions (
    region_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    city_id INT,
    region_name VARCHAR(100),
    country_name VARCHAR(100),
    FOREIGN KEY (city_id)
        REFERENCES cities (city_id)
);


-- ATHLETE TABLE
CREATE TABLE IF NOT EXISTS athletes (
    athlete_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    region_id INT,
    game_id INT,
    athlete_name VARCHAR(100),
    athlete_gender VARCHAR(100),
    FOREIGN KEY (region_id)
        REFERENCES regions (region_id),
    
    FOREIGN KEY (game_id)
        REFERENCES games (game_id)
);

ALTER TABLE athletes MODIFY COLUMN athlete_name VARCHAR(600);


-- TEAM TABLE
CREATE TABLE IF NOT EXISTS teams (
    team_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    region_id INT,
    team_name VARCHAR(100),
    FOREIGN KEY (region_id)
        REFERENCES regions (region_id)
);