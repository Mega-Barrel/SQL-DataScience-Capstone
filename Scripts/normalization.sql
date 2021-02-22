USE uc_davis;

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
    
    FOREIGN KEY (athlete_id) REFERENCES athlete(athlete_id),
    FOREIGN KEY (game_id) REFERENCES game(game_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id),
	FOREIGN KEY (medal_id) REFERENCES medal(medal_id) 
);


-- MEDAL TABLE
CREATE TABLE IF NOT EXISTS medal (
    medal_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    medal_type VARCHAR(20) NOT NULL
);


-- EVENTS TABLE
CREATE TABLE IF NOT EXISTS events (
    event_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sport_id INT,
    event_name VARCHAR(50),
    FOREIGN KEY (sport_id)
        REFERENCES sports (sport_id)
);


-- SPORTS TABLE
CREATE TABLE IF NOT EXISTS sports (
    sport_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sport_name VARCHAR(50)
);


-- GAME TABLE
CREATE TABLE IF NOT EXISTS game (
    game_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    city_name VARCHAR(50) NOT NULL,
    season VARCHAR(50) NOT NULL
);


-- ATHLETE TABLE
CREATE TABLE IF NOT EXISTS athlete (
    athlete_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    noc_id INT NOT NULL,
    athlete_name VARCHAR(30),
    athlete_gender VARCHAR(10),
    FOREIGN KEY (noc_id)
        REFERENCES noc (noc_id)
);


-- NOC TABLE
CREATE TABLE IF NOT EXISTS noc (
    noc_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    noc_name VARCHAR(20) NOT NULL
);


-- TEAM TABLE
CREATE TABLE IF NOT EXISTS team (
    team_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    noc_id INT,
    team_name VARCHAR(100),
    FOREIGN KEY (noc_id)
        REFERENCES noc (noc_id)
);