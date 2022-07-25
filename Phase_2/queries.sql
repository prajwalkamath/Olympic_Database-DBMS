\c olympic_database
--SIMPLE QUERIES

--1)NAME OF COACH FOR Mercedes Foster
SELECT coach_first_name,coach_last_name
FROM coach,coaches,competitor 
WHERE coach.coach_id=coaches.coach_id AND
      competitor.competitor_id=coaches.competitor_id AND
      competitor.firstname='Mercedes' AND competitor.lastname='Foster';

--2)Display all the events that were held in the 2010 winter Olympics.
SELECT event.event_name
FROM event, olympic
WHERE event.olympiad_id = olympic.olympiad_id AND
      olympic.year_ = 2010 AND
	  olympic.season = 'Winter';

--3)For each competitor, list their full names and the total number of races the 
--    competitor was in.
SELECT competitor.firstname, competitor.lastname, COUNT(competitor_event.competitor_id)
FROM competitor LEFT OUTER JOIN competitor_event ON competitor.competitor_id = competitor_event.competitor_id
GROUP BY competitor.firstname,
         competitor.lastname;

--4)List the competitor countries in the event men's Basketball in alphabetical order in the 2012 London Olympics.
SELECT DISTINCT country.country_name
FROM country, competitor, competitor_event
WHERE country.country_id = competitor.country_id AND
      competitor.competitor_id = competitor_event.competitor_id AND
	  competitor_event.event_id = 1  
ORDER BY country.country_name ASC;

--5)List the full names of all competitors in the 2012 London Olympics from Australia  
SELECT DISTINCT (competitor.firstname, competitor.lastname)
FROM competitor, competitor_event, event, olympic
WHERE competitor.competitor_id = competitor_event.competitor_id AND 
      competitor_event.event_id = event.event_id AND
      event.olympiad_id = olympic.olympiad_id AND
      competitor.country_id = 4 AND  	  
      olympic.olympiad_id = 1;    -- olympiad id 1 is london, uk 2012

--6)For each country, display the country name and the total number of competitors, 
--     including those countries that have no competitors, in descending order of the 
--     number of competitors.
SELECT DISTINCT country.country_name, COUNT(competitor_event.competitor_id)
FROM country LEFT OUTER JOIN competitor ON country.country_id = competitor.country_id
             LEFT OUTER JOIN competitor_event ON competitor.competitor_id = competitor_event.competitor_id
GROUP BY country.country_name
ORDER BY COUNT(competitor_event.competitor_id) DESC;

--7)Count the number of competitors who were from the Philippines 
--     in every Olympics held since 1999.
SELECT olympic.year_, COUNT(competitor.competitor_id)
FROM competitor LEFT OUTER JOIN competitor_event ON competitor.competitor_id = competitor_event.competitor_id
             LEFT OUTER JOIN event ON competitor_event.event_id = event.event_id
             LEFT OUTER JOIN olympic ON event.olympiad_id = olympic.olympiad_id
WHERE olympic.year_ >= 1999 AND
      competitor.country_id = 7   -- country id 7 is Philippines
GROUP BY olympic.year_;

--8)List all the competitors who have competed in more than 2 events in any 
--    Olympics since 1999. 
SELECT competitor.competitor_id, 
       competitor.firstname,
       competitor.lastname
FROM competitor, 
     competitor_event, 
     event, 
     olympic
WHERE competitor.competitor_id = competitor_event.competitor_id AND
      competitor_event.event_id = event.event_id AND
      event.olympiad_id = olympic.olympiad_id AND
      olympic.year_ >= 1999
GROUP BY competitor.competitor_id, competitor.firstname, competitor.lastname
HAVING COUNT(competitor_event.competitor_id) >= 2;

--9)Display the results of the men�s 1500 freestyle event in the 2008 Beijing Olympics.
SELECT competitor.competitor_id, 
       competitor.firstname, 
       competitor.lastname,
	   medal.medal_name,
	   country.country_name
FROM competitor,
     competitor_event,
     event,
	 medal,
	 country
WHERE competitor.competitor_id = competitor_event.competitor_id AND 
      competitor_event.event_id = event.event_id AND 
	  event.event_id = 7 AND  -- event id 7 is men 1500 free style event in Beijing, China 2008
      competitor_event.medal_id = medal.medal_id AND
	  competitor.country_id = country.country_id;

--10)Lists the total number of gold medals won by each country.
SELECT country.country_name, 
	   COUNT(competitor_event.medal_id)
FROM country,
     competitor,
	 competitor_event
WHERE country.country_id = competitor.country_id AND 
      competitor.competitor_id = competitor_event.competitor_id AND
	  competitor_event.medal_id = 2  -- Medal id 2 is Gold
GROUP BY country.country_name;

--11)NAME OF ATHLETES WITH NO MEDALS
SELECT competitor.firstname,competitor.lastname
FROM competitor
WHERE competitor.competitor_id NOT IN(
SELECT competitor.competitor_id
       FROM competitor,competitor_event
       WHERE competitor.competitor_id = competitor_event.competitor_id
       AND competitor_event.medal_id IN (2,3,4)
       );