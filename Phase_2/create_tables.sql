drop database olympic_database;
create database olympic_database;

\c olympic_database

CREATE TABLE country(
    country_id   INTEGER NOT NULL,
    country_name VARCHAR(30) NOT NULL,
    CONSTRAINT country_pk PRIMARY KEY(country_id)
);

CREATE TABLE competitor (
    competitor_id    INTEGER NOT NULL,
    country_id    INTEGER NOT NULL,
    firstname     VARCHAR(20) NOT NULL,
    lastname      VARCHAR(20) NOT NULL,
    gender        CHAR(1) NOT NULL,
    date_of_birth DATE NOT NULL,
    CONSTRAINT competitor_pk PRIMARY KEY (competitor_id),
    CONSTRAINT competitor_fk1 FOREIGN KEY (country_id) REFERENCES country(country_id) ON DELETE RESTRICT
);


CREATE TABLE coach(
    coach_id            INTEGER NOT NULL,
    coach_first_name    VARCHAR(20) NOT NULL,
    coach_last_name     VARCHAR(20) NOT NULL,
    gender              CHAR(1) NOT NULL,
    CONSTRAINT coach_pk PRIMARY KEY (coach_id)
);

CREATE TABLE coaches(
    coach_id            INTEGER NOT NULL,
    competitor_id    INTEGER NOT NULL,
    CONSTRAINT coaches_fk1 FOREIGN KEY (coach_id) REFERENCES coach(coach_id) ON DELETE RESTRICT,
    CONSTRAINT coaches_fk2 FOREIGN KEY (competitor_id) REFERENCES competitor(competitor_id) ON DELETE RESTRICT,
    CONSTRAINT coaches_pk PRIMARY KEY (coach_id, competitor_id)
);

/*
CREATE TABLE represents(
    competitor_id    INTEGER NOT NULL,
    country_id       INTEGER NOT NULL,
    coach_name      VARCHAR(20) NOT NULL,
    CONSTRAINT represents_pk PRIMARY KEY(competitor_id, country_id),
    CONSTRAINT represents_fk1 FOREIGN KEY (competitor_id) REFERENCES competitor(competitor_id) ON DELETE RESTRICT,
    CONSTRAINT represents_fk2 FOREIGN KEY (country_id) REFERENCES country(country_id) ON DELETE RESTRICT
);
*/

CREATE TABLE medal (
    medal_id   INTEGER NOT NULL,
    medal_name VARCHAR(10) NOT NULL,
    CONSTRAINT medal_pk PRIMARY KEY (medal_id)
);

CREATE TABLE category (
    category_id   INTEGER NOT NULL,
    category_name VARCHAR(20) NOT NULL,
    CONSTRAINT category_pk PRIMARY KEY (category_id)
);

CREATE TABLE olympic (
    olympiad_id INTEGER NOT NULL,
	country_id  INTEGER NOT NULL,
    season      VARCHAR(10) NOT NULL,
    year_       INTEGER NOT NULL,
    city        VARCHAR(50) NOT NULL,
    CONSTRAINT olympic_pk PRIMARY KEY (olympiad_id),
	CONSTRAINT olympic_fk FOREIGN KEY (country_id) REFERENCES country(country_id) ON DELETE RESTRICT
);


CREATE TABLE event (
    event_id        INTEGER NOT NULL,
    olympiad_id     INTEGER NOT NULL,
    category_id     INTEGER NOT NULL,
    event_name      VARCHAR(40) NOT NULL,
    gender          CHAR(1) NOT NULL,
    team            CHAR(1) NOT NULL,
	location		VARCHAR(100) NOT NULL,
	start_date		DATE NOT NULL,
	end_date		DATE NOT NULL,
    CONSTRAINT event_pk PRIMARY KEY (event_id),
	CONSTRAINT event_fk1 FOREIGN KEY (olympiad_id) REFERENCES olympic(olympiad_id) ON DELETE RESTRICT,
	CONSTRAINT event_fk2 FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE RESTRICT
);

CREATE TABLE competitor_event (
    competitor_event_id INTEGER NOT NULL,
    competitor_id        INTEGER NOT NULL,
    event_id          INTEGER NOT NULL,
	medal_id		  INTEGER NOT NULL,
    CONSTRAINT athlete_event_pk PRIMARY KEY (competitor_event_id),
	CONSTRAINT athlete_event_fk1 FOREIGN KEY (competitor_id) REFERENCES competitor(competitor_id) ON DELETE RESTRICT,
	CONSTRAINT athlete_event_fk2 FOREIGN KEY (event_id) REFERENCES event(event_id) ON DELETE RESTRICT,
	CONSTRAINT athlete_event_fk3 FOREIGN KEY (medal_id) REFERENCES medal(medal_id) ON DELETE RESTRICT
);