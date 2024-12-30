SELECT *
FROM world_life_expectancy;

#Finding out if duplicates exist in this table.
SELECT Country, Year, CONCAT(Country,Year), COUNT(CONCAT(Country,Year))
FROM world_life_expectancy
GROUP BY Country, Year, CONCAT(Country,Year)
HAVING COUNT(CONCAT(Country,Year)) > 1;

#Duplicate row ids are then identified.
SELECT *
FROM(
SELECT row_id,
CONCAT(Country,Year),
ROW_NUMBER() OVER( PARTITION BY CONCAT(Country,Year) ORDER BY CONCAT(Country,Year)) as Row_Num
FROM world_life_expectancy
)AS Row_table
Where Row_Num > 1;

#Duplicate row ids are delected from the table.
DELETE FROM world_life_expectancy
WHERE 
    Row_id IN (
    SELECT row_id
FROM(
SELECT row_id,
CONCAT(Country,Year),
ROW_NUMBER() OVER( PARTITION BY CONCAT(Country,Year) ORDER BY CONCAT(Country,Year)) as Row_Num
FROM world_life_expectancy
)AS Row_table
Where Row_Num > 1);


#Replace all the blank status of coutries together developing or developed as we dont want blank cells. We also do this as countries in the table already have a status its just some are blank therefore we can confidently predict the blanks.
SELECT *
FROM world_life_expectancy
WHERE STATUS = '';

#We Identify here how many status types there are, developing and developed.
SELECT DISTINCT(status)
FROM world_life_expectancy
WHERE STATUS <> '';

#Identifiying all the unique countries in the table
SELECT DISTINCT(Country)
FROM world_life_expectancy
WHERE Status = 'Developing';

#Updating the table to any country which is unqiue found in the query above to a status of developing. But there are two reasons to not do this. Firstly , this will set all countries to developing which isnt true. Secondly, this does not work and results in an error as we are using a subquery.
UPDATE world_life_expectancy
SET Status = 'Developing'
WHERE Country IN (
                SELECT DISTINCT(Country)
                FROM world_life_expectancy
                WHERE Status = 'Developing');

#So we need a work around, we do a self join and set the status to developing on t1. We can say where on t1 status is blank and also t2. status isnt blank(if we put blank here it would be contradicting and wouldnt work) and t2.status is developing (this makes sure that you are not filling out every row empty status in t1 with developing as some are developed)  
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
    ON t1.Country = t2.country
SET t1.Status = 'Developing'
WHERE t1.Status = ''
AND t2.Status <> '' 
AND t2.Status = 'Developing'
;

#To check if everything worked and we see only one status is empty which is USA and so we need to do the same thing but change it to developed.
SELECT *
FROM world_life_expectancy
WHERE STATUS = '';

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
    ON t1.Country = t2.country
SET t1.Status = 'Developed'
WHERE t1.Status = ''
AND t2.Status <> '' 
AND t2.Status = 'Developed'
;

SELECT *
FROM world_life_expectancy;

#Checking for any blanks in the life expectancy. We can tell in the data just by looking it that it seems by every year the life expectancy either stays the same or goes up incrementally.
SELECT * 
FROM world_life_expectancy
WHERE`Life expectancy` = '';

#So we are going to fill out the the blanks with the average life expectancy from the previous year and then the next year. 
SELECT Country, Year, `Life expectancy`
FROM world_life_expectancy
WHERE `Life expectancy` = '';


#Just spectating the data.
SELECT Country, Year, `Life expectancy`
FROM world_life_expectancy

#Align the year before and year after of the life expectancy with the current year or t1 and then we need to find the average of the two other colums. The t1 then be populated with the average of the t2 and t3. 
SELECT t1.Country, t1.Year, t1.`Life expectancy`,
t2.Country, t2.Year, t2.`Life expectancy`,
t3.Country, t3.Year, t3.`Life expectancy`,
ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
    ON t1.Country = t2.Country
    AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
    ON t1.Country = t3.Country
    AND t1.Year = t3.Year + 1
Where t1. `Life expectancy` = ''
;


#Now we need to update the table with those new average values.
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
    ON t1.Country = t2.Country
    AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
    ON t1.Country = t3.Country
    AND t1.Year = t3.Year + 1
SET t1. `Life expectancy` = ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
WHERE t1. `Life expectancy`= ''
;

#Now lets recheck that there are no blanks that remain. This should show no solutions.
SELECT Country, Year, `Life expectancy`
FROM world_life_expectancy
WHERE `Life expectancy` = '';

#Check the whole table.
SELECT *
FROM world_life_expectancy


