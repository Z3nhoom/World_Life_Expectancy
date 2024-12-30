#Exploratory data analysis
#There are two parts. 1st part is on conjunction with data cleaning and fixing wrong data, 2nd part is trying to find the insights and trends. 

SELECT *
FROM world_life_expectancy
;

#Lets initially find the maximum and minimum life expectancy over the last 16 years of every country and then see which country has made the largest improvements.

SELECT Country, 
MIN(`Life expectancy`),
MAX(`Life expectancy`),
ROUND(MAX(`Life expectancy`) - MIN(`Life expectancy`),1) AS Life_increase_16_Years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life expectancy`) <> '0'
AND MAX(`Life expectancy`) <> '0'
ORDER BY Life_increase_16_Years DESC
;

#To find out the average world wide life expectancy per year. 
SELECT Year, ROUND(AVG(`Life expectancy`),2)
FROM world_life_expectancy
WHERE `Life expectancy` <> '0'
GROUP BY Year
ORDER BY Year
; 

#Lets see if there is a correlation between GDP life expectancy. I am switching between DESC and ASC to find Correlations and you can see that there is a correlation. The higher the average GDP the longer the life expectancy. If we want to make sure of correlations then a visualisation tool should be used. 
SELECT Country, ROUND(AVG(`Life expectancy`),1) as Life_EXP, ROUND(AVG(GDP),1) as GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Life_EXP <> '0'
AND GDP <> '0'
ORDER BY GDP DESC
;


#To make more use of this information then bucket (place the data into groups) and give them categories. Using a case statement and group on those. How? Well when GDP is over a certain number then thats a high GDP and if a high Life expectancy then group, do the same for low life expectancy. 
#Get a grasp of the 1/2 way point 

SELECT *
FROM world_life_expectancy
ORDER BY GDP; 

#Super interesting as we can see a low GDP has a 10 year reduction in life expectancy when compared to a high GDP based on the fact that a high GDP is anything equal to or over 15,000 and vice versa for a low GDP. a high GDP life expectancy average at 74 years old while an average low was 65 years old. That is a high positive correlation. 
SELECT 
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) High_GDP_Count,
AVG (CASE WHEN GDP >= 1500 THEN `Life expectancy` ELSE NULL END) High_GDP_Life_Expectancy,
SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) Low_GDP_Count,
AVG (CASE WHEN GDP <= 1500 THEN `Life expectancy` ELSE NULL END) Low_GDP_Life_Expectancy
FROM world_life_expectancy;

#Lets see if there is a correlation between Status (Developed and Developing) and the life expectancy. 
SELECT Status, ROUND(AVG(`Life expectancy`))
FROM world_life_expectancy
GROUP BY Status
;

#But we can not see how many places are listed in each of the places. So although there is a much higher life expectancy in the developed countries there is a lot less data for the developed status compared to the developing status. 
SELECT Status, COUNT(DISTINCT Country), ROUND(AVG(`Life expectancy`))
FROM world_life_expectancy
GROUP BY Status
;


SELECT *
FROM world_life_expectancy
ORDER BY GDP; 

#Now lets look at the country, BMI and life expectancy. Interesting as the higher BMI then the more likely is a population going to live longer which is interesting because usually people with high BMI tend to die earlier but not in this case. There seems to be a correlation between low BMI and low the life expectancy however with a quick visualisation it is hard to notice this, statistical analysis would enhance the validity of the data.

SELECT Country, ROUND(AVG(`Life expectancy`),1) as Life_EXP, ROUND(AVG(BMI),1) BMI_AVG
FROM world_life_expectancy
GROUP BY Country
HAVING Life_EXP > 0 
AND BMI_AVG > 0
ORDER BY BMI_AVG DESC
;

#We are now going to take a look at adult mortality per country and we are going to use a rolling total. When you scroll to the bottom of every country we can see the total number of peole who died in each country over the last 16 years.
SELECT Country,
Year,
`Life expectancy`,
`Adult Mortality`,
SUM(`Adult Mortality`)OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy
;

#Here we can identify the countries with the highest and lowest mortality over the last 16 years. 
SELECT Country, MAX(Rolling_total) 
FROM ( SELECT Country,
Year,
`Life expectancy`,
`Adult Mortality`,
SUM(`Adult Mortality`)OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy) rollingT
group by Country; 


# An interesting insight would be to get the population for each country from another source and see the percentage of adults are dieing each year.


