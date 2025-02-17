# Corona Virus Analysis

  ### Description
The CORONA VIRUS pandemic has had a significant impact on public health and has created an urgent 
need for data-driven insights to understand the spread of the virus

## About Dataset

- Province: Geographic subdivision within a country/region.

- Country/Region: Geographic entity where data is recorded.

- Latitude: North-south position on Earth's surface.

- Longitude: East-west position on Earth's surface.

- Date: Recorded date of CORONA VIRUS data.

- Confirmed: Number of diagnosed CORONA VIRUS cases.

- Deaths: Number of CORONA VIRUS related deaths.

- Recovered: Number of recovered CORONA VIRUS cases.

### Problem Statement

Analyzing a CORONA VIRUS dataset to derive meaningful insights and present findings

### Steps Followed

- Creation of database

- Creation of table with neccessary columns so as import data into the database 

- Loading the dataset into table

   Snapshot of dataset
![Dataset](https://github.com/daodu-tobi/Corona-Virus-Analysis---SQL/assets/145832039/4ac88b7b-393a-444d-9b57-9ddc2df7943f)

- Data Cleaning and Manipulation

  Creating a new date column using the data in the original date column to populate the new column and setting the data type to date.

  Deleting the old date column
  
  Checking for null values in the data set

- Analysis

- Finding the start date and end date of corona virus pandemic

  Screen shot of query output 

  ![Start Date](https://github.com/daodu-tobi/Corona-Virus-Analysis---SQL/assets/145832039/02c5d126-ab96-4b91-84ee-80570f92179f)

- Finding monthly average of confirmed cases, death cases and recovered cases

![Monthly average](https://github.com/daodu-tobi/Corona-Virus-Analysis---SQL/assets/145832039/5f2a0957-a62c-46cf-8646-e85c7d7bee0b)

- Top 5 countries with highest cases

![Top 5 countries](https://github.com/daodu-tobi/Corona-Virus-Analysis---SQL/assets/145832039/9d347c85-a6c6-454c-b784-9fe9240a0363)

- Checking how corona virus spread out with respect to recovered case (Eg.: total confirmed cases, their average, variance & STDEV )
	 
![Recovered](https://github.com/daodu-tobi/Corona-Virus-Analysis---SQL/assets/145832039/f693d68f-82d6-4e98-a06a-60bc118d3e55)

### Insights

- The corona virus data indicates the period was from January 2020 to June 2021

- There are 154 unique countries involved in the corona virus cases 
   
- Kiribati(Country) has the lowest number of death cases with zero.

- USA has the highest number of confirmed cases (33461982)

- Top 5 countries with the highest number of recovered cases 

  India  = 28089649

  Brazil = 15400169

  US = 6303715

  Turkey  = 5202251

  Russia   = 4745756
