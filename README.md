**World Life Expectancy Project**

**World Life Expectancy Data Cleaning Project Summary**

​

Project Description:


This project involved cleaning the world_life_expectancy dataset to ensure data accuracy and consistency for analysis. The process included identifying and removing duplicates, correcting inconsistent data entries, and filling in missing values.

​

Key Skills Utilized:

​

- SQL Data Querying: Used SQL to SELECT, COUNT, and group data to identify duplicates and inconsistencies.

- Removing Duplicates: Assigned row numbers to duplicates using ROW_NUMBER() OVER(PARTITION BY ...) for easy identification and deletion.

- Data Standardization: Ensured all countries had a status of either 'Developing' or 'Developed' based on previous data.

- Data Imputation: Filled missing values based on logical predictions from existing data.

- Data Validation: Checked for and corrected any remaining empty entries in the dataset.

 

Detailed Steps:

​

- Initial Data Inspection:

Queried the dataset to inspect the data.

​

- Identifying Duplicates:

Checked for duplicate rows by concatenating Country and Year.

​

- Removing Duplicates:

Assigned row numbers to duplicates for identification.

Deleted duplicates while ensuring data integrity.

Ensured that a backup was saved before any table alterations.
 

- Standardizing Country Status:

Identified and filled missing statuses with 'Developing' or 'Developed' based on existing data, for example, if Afghanistan was corresponded with developing status however one row contained a null value, then it was populated with Developing. 

​

- Filling Missing Life Expectancy Values:

Identified rows with missing life expectancy values and filled them with the average of the previous and next year's values.

​

​

Outcome:


The data cleaning process ensured that the world_life_expectancy dataset was accurate, consistent, and ready for further analysis. It is rare to come across data that is completely clean. Clean data is necessary to conduct analysis and to extract insights. Although no visuals were assembled from this data, dirty data would be a lot more apparent when visualised. 



**World Life Expectancy Exploratory Data Analysis Project Summary**

​

Project Description:


This project involved conducting exploratory data analysis (EDA) on the world_life_expectancy dataset to uncover insights about life expectancy trends, correlations with economic and health factors, and overall global health patterns over a 16-year period. The analysis included fixing wrong data, identifying trends, and extracting meaningful insights.

​

​

Key Skills Utilized:

​

- SQL Data Querying: Extensively used SQL to select, group, and order data to derive meaningful insights.

- Data Aggregation: Applied aggregate functions (SUM, AVG, ROUND) to summarize data and calculate averages.

- Data Filtering: Used HAVING and WHERE clauses to filter data based on specific conditions.

- Data Correlation Analysis: Identified correlations between GDP, BMI, adult mortality, and life expectancy.

- Data Visualization Preparation: Prepared data for visualization to confirm correlations and insights.

​

​

Detailed Steps:

​

- Initial Data Inspection:

Queried the dataset to understand its structure and contents (This is the key step to look at the bigger picture).

 

​

- Life Expectancy Trends:

Identified each country's maximum, minimum, and average life expectancy over the last 16 years.

Calculated the life expectancy increase for each country to determine which country has made the largest improvements.

Countries that have made the largest improvements in life expectancy over the last 16 years can be identified. This highlights successful health policies and improvements in living conditions.

Insight:

The average global life expectancy trend over the years showed overall improvements in global health.

The average world life expectancy unsurprisingly increased from 68.2 years in 2012 to 71.6 in 2022, that's a 5% increase over the last 10 years.

The countries with the largest change in life expectancy in the last 16 years were Haiti ( Increasing by 28.7 Years),  Zimbabwe ( Increasing by 22.7 years), and Eritrea (Increasing by 21.7 years).



 

- Correlation Between GDP and Life Expectancy:
 

Ensuring here that zero values were not included as neither GDP nor life expectancy can be zero. This makes sure that there is accuracy in the data output. 

Insight:

There is a positive correlation between GDP and life expectancy, indicating that wealthier countries tend to have higher life expectancy. This suggests that economic prosperity heavily contributes to better healthcare and living standards.
​


 

- Categorizing GDP and Life Expectancy:

Categorized countries into high GDP and low GDP groups and calculated average life expectancy for each group to confirm high correlation.

​

Insight:

Countries with high GDP (>= 15,000) have a significantly higher average life expectancy compared to those with low GDP (<=15,000), further reinforcing the correlation between economic status and health outcomes.

A low GDP has approximately a 10-year reduction in life expectancy when compared to a high GDP.  A high GDP life expectancy averaged 74 years old while an average Low GDP life expectancy was 65 years old. Therefore we can confirm there is a high positive correlation between GDP and life expectancy. 



 

- Correlation Between Status and Life Expectancy:

Analyzed the correlation between country status (Developed vs. Developing) and life expectancy.​

Checked the number of countries in each status category to ensure data balance.​
 

Insight:

Developed countries have a higher average life expectancy compared to developing countries. However, there is more data available for developing countries, which may affect the overall analysis.


 

- BMI and Life Expectancy Analysis:

Analyzed the correlation between BMI and life expectancy, revealing that higher BMI often correlates with longer life expectancy in this dataset.

​

Insight:

Higher BMI is often associated with higher life expectancy in this dataset, contrary to common assumptions. This could be due to better healthcare and nutrition in countries with higher BMI. However, further analysis such as using standard deviation is required to see if the difference is significant. 


 

- Adult Mortality Analysis:

Used a rolling total to analyze adult mortality per country over the last 16 years, providing insights into the total number of adult deaths in each country.

​

Insight:

The rolling total of adult mortality provides an understanding of mortality trends and the cumulative impact of mortality over the years in each country.

​

​

Outcome:


The exploratory data analysis provided valuable insights into global life expectancy trends, the impact of GDP on life expectancy, and the relationship between various health and economic factors. This analysis helps in understanding the socioeconomic patterns affecting life expectancy and can inform policy-making and further research. The use of statistical analysis as well as visualisation of the data sets would confirm insights and would make it easier to relay to an audience. 
