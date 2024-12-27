# World_Life_Expectancy

World Life Expectancy Data Cleaning Project Summary

​

Project Description:


This project involved cleaning the world_life_expectancy dataset to ensure data accuracy and consistency for analysis. The process included identifying and removing duplicates, correcting inconsistent data entries, and filling in missing values.

​

Key Skills Utilized:

​

SQL Data Querying: Used SQL to select, count, and group data to identify duplicates and inconsistencies.

Removing Duplicates: Assigned row numbers to duplicates using ROW_NUMBER() OVER(PARTITION BY ...) for easy identification and deletion.

Data Standardization: Ensured all countries had a status of either 'Developing' or 'Developed'.

Data Imputation: Filled missing values based on logical predictions from existing data.

Data Validation: Checked for and corrected any remaining erroneous entries in the dataset.

 

Detailed Steps:

​

Initial Data Inspection:

Queried the dataset to inspect the data.

​

Identifying Duplicates:

Checked for duplicate rows by concatenating Country and Year.

​

Data Deduplication:

Assigned row numbers to duplicates for identification.

Deleted duplicates while ensuring data integrity.

Standardizing Country Status:

Identified and filled missing statuses with 'Developing' or 'Developed' based on existing data.

​

Filling Missing Life Expectancy Values:

Identified rows with missing life expectancy values and filled them with the average of the previous and next year's values.

​

​

Outcome:


The data cleaning process ensured that the world_life_expectancy dataset was accurate, consistent, and ready for further analysis. This included removing duplicates, standardizing country status, and filling missing life expectancy values, which contributed to more reliable and insightful data analysis results.

World Life Expectancy Exploratory Data Analysis Project Summary

​

Project Description:


This project involved conducting exploratory data analysis (EDA) on the world_life_expectancy dataset to uncover insights about life expectancy trends, correlations with economic and health factors, and overall global health patterns over a 16-year period. The analysis included fixing wrong data, identifying trends, and extracting meaningful insights.

​

​

Key Skills Utilized:

​

SQL Data Querying: Extensively used SQL to select, group, and order data to derive meaningful insights.

Data Aggregation: Applied aggregate functions (SUM, AVG, ROUND) to summarize data and calculate averages.

Data Filtering: Used HAVING and WHERE clauses to filter data based on specific conditions.

Data Correlation Analysis: Identified correlations between GDP, BMI, adult mortality, and life expectancy.

Data Visualization Preparation: Prepared data for visualization to confirm correlations and insights.

​

​

Detailed Steps:

​

Initial Data Inspection:

Queried the dataset to understand its structure and contents.

​

Life Expectancy Trends:

Identified the maximum and minimum life expectancy over the last 16 years for each country.

Calculated the life expectancy increase for each country to determine which country has made the largest improvements..​

Countries that have made the largest improvements in life expectancy over the last 16 years can be identified. This highlights successful health policies and improvements in living conditions.

Average Worldwide Life Expectancy:

Calculated the average worldwide life expectancy per year.

​

Insight:

The trend of average global life expectancy over the years can be visualized, showing overall improvements in global health.

Correlation Between GDP and Life Expectancy:

Analyzed the correlation between GDP and life expectancy, showing that higher GDP generally correlates with longer life expectancy.

​

Insight:

There is a positive correlation between GDP and life expectancy, indicating that wealthier countries tend to have higher life expectancy. This suggests that economic prosperity contributes to better healthcare and living standards.

Categorizing GDP and Life Expectancy:

Categorized countries into high GDP and low GDP groups and calculated average life expectancy for each group to confirm high correlation.

​

Insight:

Countries with high GDP (>= 15,000) have a significantly higher average life expectancy compared to those with low GDP, further reinforcing the correlation between economic status and health outcomes.

Correlation Between Status and Life Expectancy:

Analyzed the correlation between country status (Developed vs. Developing) and life expectancy.

​

Checked the number of countries in each status category to ensure data balance.

​

Insight:

Developed countries have a higher average life expectancy compared to developing countries. However, there is more data available for developing countries, which may affect the overall analysis.

BMI and Life Expectancy Analysis:

Analyzed the correlation between BMI and life expectancy, revealing that higher BMI often correlates with longer life expectancy in this dataset.

​

Insight:

Higher BMI is often associated with higher life expectancy in this dataset, contrary to common assumptions. This could be due to better healthcare and nutrition in countries with higher BMI.

Adult Mortality Analysis:

Used a rolling total to analyze adult mortality per country over the last 16 years, providing insights into the total number of adult deaths in each country.

​

Insight:

The rolling total of adult mortality provides an understanding of mortality trends and the cumulative impact of mortality over the years in each country.

​

​

Outcome:


The exploratory data analysis provided valuable insights into global life expectancy trends, the impact of GDP on life expectancy, and the relationship between various health and economic factors. This analysis helps in understanding the socioeconomic patterns affecting life expectancy and can inform policy-making and further research.
