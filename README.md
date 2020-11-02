# Baseball-database-drills
SQL drills baseball project

Here are the questions for the baseball drills questions

1. Write a query that returns the namefirst and namelast fields of the people table, along with the inducted field from the hof_inducted table. All rows from the people table should be returned, and NULL values for the fields from hof_inducted should be returned when there is no match found.

2. Write a query that returns the yearid, playerid, teamid, and salary fields from the salaries table, along with the category field from the hof_inducted table. Keep only the records that are in both salaries and hof_inducted. Hint: Although a field named yearid is found in both tables, don't JOIN by it. But you must explicitly name which field to include.

3. Write a query that returns the playerid, yearid, teamid, lgid, and salary fields from the salaries table and the inducted field from the hof_inducted table. Keep all records from both tables.

4. There are two tables, hof_inducted and hof_not_inducted, indicating successful and unsuccessful inductions into the Baseball Hall of Fame, respectively.
Combine these two tables by all fields. Keep all records.
Get a distinct list of all player IDs for players who have been put up for HOF induction.

5. Write a query that returns the last name, first name (see the people table), and total recorded salaries for all players found in the salaries table.

6. Write a query that returns all records from the hof_inducted and hof_not_inducted tables that include playerid, yearid, namefirst, and namelast. Hint: Each FROM statement will include a LEFT OUTER JOIN.

7. Return a table including all records from both hof_inducted and hof_not_inducted. Include a new field, namefull, which is formatted as namelast , namefirst (in other words, the last name, followed by a comma, then a space, then the first name). The query should also return the yearid and inducted fields. Include only records since 1980 from both tables. Sort the resulting table by yearid, then inducted so that Y comes before N. Finally, sort by the namefull field alphabetically.

8. Select birthyear, deathyear, namefirst, and namelast of all the players born since the birth year of Babe Ruth (whose playerid is ruthba01). Sort the results by birth year from low to high

9. Using the people table, write a query that returns namefirst, namelast, and a field called usaborn. The usaborn field should show the following: if the player's birthcountry is the USA, then the record is USA. Otherwise, it's non-USA. Order the results by non-USA records first.

10. Calculate the average height for players throwing with their right hand versus their left hand. Name these fields right_height and left_height, respectively

11. Get the average of each team's maximum player salary since 2010. Hint: WHERE will go outside of your CTE.

