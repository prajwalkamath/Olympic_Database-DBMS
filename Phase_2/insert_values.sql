\c olympic_database
INSERT INTO country VALUES
(1, 'United Kingdom'),
(2, 'Greece'),
(3, 'China'),
(4, 'Australia'),
(5, 'South Korea'),
(6, 'Japan'),
(7, 'Philippines'),
(8, 'Africa');

INSERT INTO medal VALUES
(1, 'None'),
(2, 'Gold'),
(3, 'Silver'),
(4, 'Bronze');

INSERT INTO olympic VALUES
(1, 1, 'Summer', 2012, 'London'),  
(2, 2, 'Winter', 2011, 'Athens'), 
(3, 3, 'Fall', 2008, 'Beijing'),   
(4, 4, 'Autumn', 1999, 'Sydney'),  
(5, 5, 'Summer', 1998, 'Tokyo'),   
(6, 8, 'Winter', 2010, 'Ghana');  

INSERT INTO category VALUES
(1, 'Ball Games'),
(2, 'Archery'),
(3, 'Badminton'),
(4, 'Fencing'),
(5, 'Boxing'),
(6, 'Swimming'),
(7, 'Track'),
(8, 'Gymnastics');

INSERT INTO competitor VALUES
(1, 4, 'Mercedes', 'Foster', 'M', '18-DEC-1988'),       
(2, 4, 'Samatha', 'Gardner', 'F', '27-JUL-1984'),       
(3, 1, 'Riley', 'George', 'M', '19-AUG-1952'),          
(4, 1, 'Clarence', 'Rodriguez', 'F', '23-DEC-1986'),    
(5, 7, 'James', 'Pinkard', 'M', '8-APR-1985'),          
(6, 7, 'Marcia', 'Hardwick', 'F', '30-JUL-1980'),       
(7, 2, 'James', 'Noonan', 'M', '25-SEP-1987'),			
(8, 2, 'Patricia', 'Kowell', 'F', '16-Jun-1986');		

INSERT INTO coach VALUES
(1, 'Lewis', 'George', 'M'),
(2, 'Mary', 'Sue', 'F'),
(3, 'Aditya', 'Singh', 'M'),
(4, 'Mark', 'Kent', 'M'),
(5, 'Anne', 'Keel', 'F'),
(6, 'Catherine', 'Cook', 'F'),
(7, 'John', 'Smith', 'M'),
(8, 'Zack', 'Kent', 'M');

INSERT INTO coaches VALUES
(2,3),
(1,7),
(6,1),
(5,2),
(8,6),
(3,5),
(7,4),
(4,8);


INSERT INTO event VALUES
(1, 1, 1, 'Men Basketball', 'M', 'T', 'Burnham Park', '8-MAR-2012', '10-MAR-2012'),               
(2, 1, 6, 'Men 1500 Freestyle event', 'M', 'F', 'Pool Park', '10-FEB-2012', '12-FEB-2012'),       
(3, 5, 1, 'Women Basketball', 'F', 'T', 'Shrine Court', '12-APR-1998', '14-APR-1998'),            
(4, 4, 5, 'Men Welter Weight Boxing', 'M', 'F', 'Douglas Stadium', '14-MAY-1999', '16-MAY-1999'), 
(5, 3, 5, 'Men Heavy Weight Boxing', 'M', 'F', 'Pilar Park', '16-JUN-2008', '18-JUN-2008'),       
(6, 1, 1, 'Women Basketball', 'F', 'T', 'London Bridge Court', '18-AUG-2012', '20-AUG-2012'),     
(7, 3, 6, 'Men 1500 Freestyle event', 'M', 'F', 'Xiang Pool', '20-SEP-2008', '22-SEP-2008'),      
(8, 6, 2, 'Men 100 meter Archery', 'M', 'F', 'Sahara Desert', '22-OCT-2010', '24-OCT-2010'),      
(9, 6, 2, 'Women 100 meter Archery', 'F', 'F', 'Sahara Desert', '24-NOV-2010', '26-NOV-2010');    

INSERT INTO competitor_event VALUES
(1, 1, 1, 2), 
(2, 7, 6, 1), 
(3, 8, 1, 4), 
(4, 5, 5, 1), 
(5, 2, 6, 3), 
(6, 6, 6, 2), 
(7, 1, 2, 1), 
(8, 8, 4, 2), 
(9, 5, 7, 2),
(10, 2, 7, 1); 