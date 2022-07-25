\c olympic_database;
--add world record in event
select * from event;
ALTER TABLE event ADD COLUMN WORLD_RECORD VARCHAR(20);
UPDATE event SET WORLD_RECORD='14:31:04' WHERE event_id=2 or event_id=7;
UPDATE event SET WORLD_RECORD='1440' WHERE event_id=8;
UPDATE event SET WORLD_RECORD='1340' WHERE event_id=9;
select * from event;

--if competitor has no country
select * from competitor;
ALTER TABLE competitor ALTER COLUMN country_id drop NOT NULL;
INSERT INTO COMPETITOR VALUES (9,NULL, 'Harry', 'Stephan', 'M', '10-DEC-1988');
select * from competitor;

--if competitor gets banned
ALTER TABLE COACHES DROP CONSTRAINT coaches_fk2;
ALTER TABLE COACHES add constraint coaches_fk2 FOREIGN KEY (competitor_id) REFERENCES competitor(competitor_id) ON DELETE CASCADE;
ALTER TABLE COMPETITOR_EVENT DROP CONSTRAINT athlete_event_fk1;
ALTER TABLE COMPETITOR_EVENT add constraint athlete_event_fk1 FOREIGN KEY (competitor_id) REFERENCES competitor(competitor_id) ON DELETE CASCADE;
SELECT * FROM COMPETITOR;
SELECT * FROM COACHES;
SELECT * FROM COMPETITOR_EVENT;
DELETE FROM COMPETITOR WHERE COMPETITOR_ID=7;
SELECT * FROM COMPETITOR;
SELECT * FROM COACHES;
SELECT * FROM COMPETITOR_EVENT;

--medal should be unique
ALTER TABLE MEDAL ADD CONSTRAINT UK UNIQUE(MEDAL_NAME);
INSERT INTO MEDAL VALUES(5,'Gold');

--check constraint on event Start date and End date
ALTER TABLE EVENT ADD CONSTRAINT CK CHECK(START_DATE<=END_DATE);
INSERT INTO EVENT VALUES(10, 6, 2, 'Women 100 meter Archery', 'F', 'F', 'Sahara Desert', '24-NOV-2010', '23-NOV-2010');