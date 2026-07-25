create database titanic_db;

use titanic_db;

select * from featured_titanic;
show tables;

describe featured_titanic;

select count(*) as Total_Passengers
from featured_titanic;

# overall survival rate 

select 
round(avg(Survived)*100,2) as Survival_Rate
from featured_titanic;

# Survival by Gender 

select 
Sex, 
count(*) as Total_Passenger,
sum(Survived) as Survivors,
round(avg(survived)*100,2) as Survival_Rate
from featured_titanic
group by Sex;

# Survived by passenger class

select 
Pclass,
count(*) as Total,
round(avg(survived)*100,2) as Surviced_Rate
from featured_titanic 
group by Pclass 
order by Pclass;

# Average Fare by Passenger Class

select 
Pclass,
round(avg(Fare),2) as Average_Fare
from featured_titanic 
group by Pclass
order by Average_Fare;

# Survived by Age Group

select 
AgeGroup,
count(*) as Passengers, 
round(avg(Survived)*100,2) as Survived_Rate
from featured_titanic
group by AgeGroup;

# Survival by Family Size

select 
FamilySize,
count(*) as Passengers,
round(avg(Survived)*100,2) as Survival_Rate
from featured_titanic
group by FamilySize
order by FamilySize;

# top 10 highest fare passenger

select
Name,
Pclass,
Fare
from featured_titanic 
order by Fare desc
limit 10;

# CASE Statement - Create age categories in SQL (even though we already created AgeGroup in Python). This demonstrates SQL skills.

select 
case 
when Age<13 then 'Child'
when Age<20 then 'Teen'
when Age<36 then 'Young Adult'
when Age<60 then 'Adult'
else 'Senior'
end as Age_Category,
count(*) as Total 
from featured_titanic
group by Age_Category;

## Having clause - Find passenger classes with a survival rate above 50%.

select 
Pclass,
round(avg(Survived)*100,2) as Survival_Rate
from featured_titanic
group by Pclass 
having avg(Survived) > 0.5;

## Window Function - Rank passengers by fare.

select 
Name,
Fare,
rank() over (order by Fare desc) as Fare_Rank
from featured_titanic;

## Common Table Expression (CTE)

with SurvivalStats as (
select
Pclass,
avg(Survived) as SurvivalRate
from featured_titanic 
group by Pclass)
select * from SurvivalStats;

