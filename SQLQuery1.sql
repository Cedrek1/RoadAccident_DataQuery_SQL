select *
from dbo.RD

--Calculating Total Of Casualties

select SUM(Number_of_Casualties) as Total_Casualties
from dbo.RD


--Calculating Total Of Casualties By Accident 

select SUM(Number_of_Casualties) as Total_Of_Casualties_By_Accident_Severity_Serious
from dbo.RD
Where Accident_Severity = 'Serious'

select SUM(Number_of_Casualties) as Total_Of_Casualties_By_Accident_Severity_Serious
from dbo.RD
Where Accident_Severity = 'Slight'

select SUM(Number_of_Casualties) as Total_Of_Casualties_By_Accident_Severity_Serious
from dbo.RD
Where Accident_Severity = 'Fatal'


--Calculating Percentage  Of Casualties By Accident 


select round((SUM(Number_of_Casualties) / (select SUM(Number_of_Casualties) from dbo.RD))*100,2) as Percentage_Of_Casualties_By_Accident_Severity_Serious
from dbo.RD
Where Accident_Severity = 'Serious'


select round((SUM(Number_of_Casualties) / (select SUM(Number_of_Casualties) from dbo.RD))*100,2) as Percentage_Of_Casualties_By_Accident_Severity_Slight
from dbo.RD
Where Accident_Severity = 'Slight'


select round((SUM(Number_of_Casualties) / (select SUM(Number_of_Casualties) from dbo.RD))*100,2) as Percentage_Of_Casualties_By_Accident_Severity_Fatal
from dbo.RD
Where Accident_Severity = 'Fatal'


--Total Of Casualties By Vehicle Type 

select Vehicle_Type,SUM(Number_of_Casualties) as Total_Casualties
from dbo.RD
group by Vehicle_Type


--Monthly Calcul Showing Comparison Of Casulaties for current Year And Previous Year

--Just By The Year

SELECT Year, SUM(Number_of_Casualties) AS Total_Casualties
FROM dbo.RD
GROUP BY Year
ORDER BY Year


--By The Year And The Month

SELECT Year, Month, SUM(Number_of_Casualties) AS Total_Casualties
FROM dbo.RD
GROUP BY Year, Month
ORDER BY
    CASE
        WHEN Month = 'Jan' THEN 1
        WHEN Month = 'Feb' THEN 2
        WHEN Month = 'Mar' THEN 3
        WHEN Month = 'Apr' THEN 4
        WHEN Month = 'May' THEN 5
        WHEN Month = 'Jun' THEN 6
        WHEN Month = 'Jul' THEN 7
        WHEN Month = 'Aug' THEN 8
        WHEN Month = 'Sep' THEN 9
        WHEN Month = 'Oct' THEN 10
        WHEN Month = 'Nov' THEN 11
        WHEN Month = 'Dec' THEN 12
        ELSE NULL
    END, Year;



--Maximum Casualties By Road Type 

SELECT Road_Type,SUM(Number_of_Casualties) AS Total_Casualties
FROM dbo.RD
group by Road_Type


--Distribution of total Casualties By Road_Surface_Conditions

SELECT Road_Surface_Conditions,SUM(Number_of_Casualties) AS Total_Casualties
FROM dbo.RD
group by Road_Surface_Conditions



--Relation between Casualties by area/ Location & by Day/ Night

SELECT Urban_or_Rural_Area,[Local_Authority_(District)],Light_Conditions,SUM(Number_of_Casualties) AS Total_Casualties
FROM dbo.RD
group by Urban_or_Rural_Area,[Local_Authority_(District)],Light_Conditions




