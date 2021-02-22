USE uc_davis;

-- MAIN TABLE
CREATE TABLE IF NOT EXISTS sports_stats (
    sports_stats_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    athlete_id INT FOREIGN KEY REFERENCES athlete(athlete_id),
    game_id INT FOREIGN KEY REFERENCES game(game_id),
    event_id INT FOREIGN KEY REFERENCES events(event_id),
    medal_id INT FOREIGN KEY REFERENCES medal(medal_id),
    athlete_age INT,
    athlete_height INT,
    athlete_weight INT
);


-- MEDAL TABLE
CREATE TABLE IF NOT EXISTS medal (
    medal_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    medal_type VARCHAR(20) NOT NULL
);


-- EVENTS TABLE
CREATE TABLE IF NOT EXISTS events (
    event_id INT NOT NULL PRIMARY KET AUTO_INCREMENT,
    sport_id INT FOREIGN KEY REFERENCES sports(sports_stats_id),
    event_name VARCHAR(50)
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
    athlete_id NOT NULL PRIMARY KEY AUTO_INCREMENT,
    noc_id INT NOT NULL FOREIGN KEY REFERENCES noc(noc_id),
    athlete_name VARCHAR(30),
    athlete_gender VARCHAR(10)
);


-- NOC TABLE
CREATE TABLE IF NOT EXISTS noc (
    noc_id NOT NULL PRIMARY KEY AUTO_INCREMENT,
    noc_name VARCHAR(20) NOT NULL
);


-- TEAM TABLE
CREATE TABLE IF NOT EXISTS team (
    team_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    noc_id INT FOREIGN KEY REFERENCES noc(noc_id),
    team_name VARCHAR(100)
);