DROP TABLE IF EXISTS circuits;
CREATE TABLE circuits (
  circuit_id INT NOT NULL PRIMARY KEY,
  circuit_ref TEXT NOT NULL DEFAULT '',
  circuit_name TEXT NOT NULL DEFAULT '',
  loc TEXT DEFAULT NULL,
  country TEXT DEFAULT NULL,
  lat float DEFAULT NULL,
  lng float DEFAULT NULL,
  alt INT DEFAULT NULL,
  url TEXT NOT NULL UNIQUE DEFAULT ''
)  ;

DROP TABLE IF EXISTS constructor_results;
CREATE TABLE constructor_results (
  constructor_result_id INT NOT NULL PRIMARY KEY,
  race_id INT NOT NULL DEFAULT '0',
  constructor_id INT NOT NULL DEFAULT '0',
  points float DEFAULT NULL,
  status TEXT DEFAULT NULL
);

DROP TABLE IF EXISTS constructor_standings;
CREATE TABLE constructor_standings (
  constructor_standing_id INT NOT NULL PRIMARY KEY,
  race_id INT NOT NULL DEFAULT '0',
  constructor_id INT NOT NULL DEFAULT '0',
  points float NOT NULL DEFAULT '0',
  ranking INT DEFAULT NULL,
  ranking_text TEXT DEFAULT NULL,
  wins INT NOT NULL DEFAULT '0'
);

DROP TABLE IF EXISTS constructors;
CREATE TABLE constructors (
  constructor_id INT NOT NULL PRIMARY KEY,
  constructor_ref TEXT NOT NULL DEFAULT '',
  constructor_name TEXT NOT NULL UNIQUE DEFAULT '',
  nationality TEXT DEFAULT NULL,
  url TEXT NOT NULL DEFAULT ''
)  ;

DROP TABLE IF EXISTS driver_standings;
CREATE TABLE driver_standings (
  driver_standing_id INT NOT NULL PRIMARY KEY,
  race_id INT NOT NULL DEFAULT '0',
  driver_id INT NOT NULL DEFAULT '0',
  points float NOT NULL DEFAULT '0',
  ranking INT DEFAULT NULL,
  ranking_text TEXT DEFAULT NULL,
  wins INT NOT NULL DEFAULT '0'
);

DROP TABLE IF EXISTS drivers;
CREATE TABLE drivers (
  driver_id INT NOT NULL PRIMARY KEY,
  driver_ref TEXT NOT NULL DEFAULT '',
  driver_number INT DEFAULT NULL,
  code varchar(3) DEFAULT NULL,
  forename TEXT NOT NULL DEFAULT '',
  surname TEXT NOT NULL DEFAULT '',
  dob date DEFAULT NULL,
  nationality TEXT DEFAULT NULL,
  url TEXT NOT NULL UNIQUE DEFAULT ''
);

DROP TABLE IF EXISTS lap_times;
CREATE TABLE lap_times (
  race_id INT NOT NULL,
  driver_id INT NOT NULL,
  lap INT NOT NULL,
  ranking INT DEFAULT NULL,
  time TEXT DEFAULT NULL,
  milliseconds INT DEFAULT NULL,
  PRIMARY KEY (race_id,driver_id,lap) 
);

DROP TABLE IF EXISTS pit_stops;
CREATE TABLE pit_stops (
  race_id INT NOT NULL,
  driver_id INT NOT NULL,
  stop INT NOT NULL,
  lap INT NOT NULL,
  time TEXT NOT NULL,
  duration TEXT DEFAULT NULL,
  milliseconds INT DEFAULT NULL,
  PRIMARY KEY (race_id,driver_id,stop)
);

DROP TABLE IF EXISTS qualifying;
CREATE TABLE qualifying (
  qualifying_id INT NOT NULL PRIMARY KEY,
  race_id INT NOT NULL DEFAULT '0',
  driver_id INT NOT NULL DEFAULT '0',
  constructor_id INT NOT NULL DEFAULT '0',
  driver_number INT NOT NULL DEFAULT '0',
  ranking INT DEFAULT NULL,
  q1 TEXT DEFAULT NULL,
  q2 TEXT DEFAULT NULL,
  q3 TEXT DEFAULT NULL
);

DROP TABLE IF EXISTS races;
CREATE TABLE races (
  race_id INT NOT NULL PRIMARY KEY,
  race_year INT NOT NULL DEFAULT '0',
  round INT NOT NULL DEFAULT '0',
  circuit_id INT NOT NULL DEFAULT '0',
  race_name TEXT NOT NULL DEFAULT '',
  race_date TEXT NOT NULL DEFAULT '0000-00-00',
  race_time TEXT DEFAULT NULL,
  url TEXT UNIQUE DEFAULT NULL,
  fp1_date date DEFAULT NULL,
  fp1_time time DEFAULT NULL,
  fp2_date date DEFAULT NULL,
  fp2_time time DEFAULT NULL,
  fp3_date date DEFAULT NULL,
  fp3_time time DEFAULT NULL,
  quali_date date DEFAULT NULL,
  quali_time time DEFAULT NULL,
  sprint_date date DEFAULT NULL,
  sprint_time time DEFAULT NULL
)  ;

DROP TABLE IF EXISTS results;
CREATE TABLE results (
  result_id INT NOT NULL PRIMARY KEY,
  race_id INT NOT NULL DEFAULT '0',
  driver_id INT NOT NULL DEFAULT '0',
  constructor_id INT NOT NULL DEFAULT '0',
  driver_number INT NOT NULL DEFAULT '0',
  grid INT NOT NULL DEFAULT '0',
  ranking INT DEFAULT NULL,
  ranking_text TEXT NOT NULL DEFAULT '',
  ranking_order INT NOT NULL DEFAULT '0',
  points float NOT NULL DEFAULT '0',
  laps INT NOT NULL DEFAULT '0',
  time TEXT DEFAULT NULL,
  milliseconds INT DEFAULT NULL,
  fastest_lap INT DEFAULT NULL,
  fastest_lap_rank INT DEFAULT '0',
  fastest_lap_time TEXT DEFAULT NULL,
  fastest_lap_speed TEXT DEFAULT NULL,
  status_id INT NOT NULL DEFAULT '0'
)  ;

DROP TABLE IF EXISTS seasons;
CREATE TABLE seasons (
  season_year INT NOT NULL DEFAULT '0' PRIMARY KEY,
  url TEXT NOT NULL UNIQUE DEFAULT ''
)  ;

DROP TABLE  IF EXISTS sprint_results;
CREATE TABLE sprint_results (
  sprint_result_id INT NOT NULL PRIMARY KEY,
  race_id INT NOT NULL DEFAULT '0',
  driver_id INT NOT NULL DEFAULT '0',
  constructor_id INT NOT NULL DEFAULT '0',
  driver_number INT NOT NULL DEFAULT '0',
  grid INT NOT NULL DEFAULT '0',
  ranking INT DEFAULT NULL,
  ranking_text TEXT NOT NULL DEFAULT '',
  ranking_order INT NOT NULL DEFAULT '0',
  points float NOT NULL DEFAULT '0',
  laps INT NOT NULL DEFAULT '0',
  time TEXT DEFAULT NULL,
  milliseconds INT DEFAULT NULL,
  fastest_lap INT DEFAULT NULL,
  fastest_lap_time TEXT DEFAULT NULL,
  status_id INT NOT NULL DEFAULT '0'
)  ;

DROP TABLE IF EXISTS status;
CREATE TABLE status (
  status_id INT NOT NULL PRIMARY KEY,
  status TEXT NOT NULL DEFAULT ''
)  ;
