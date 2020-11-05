--1. 
SELECT namefirst, namelast, inducted
FROM people LEFT OUTER JOIN hof_inducted
ON people.playerid = hof_inducted.playerid;

--2. 
SELECT salaries.yearid, salaries.playerid, teamid, salary, category
FROM salaries INNER JOIN hof_inducted
ON salaries.playerid = hof_inducted.playerid;


--3.
SELECT salaries.playerid, salaries.yearid, teamid, lgid, salary, inducted
FROM hof_inducted FULL OUTER JOIN salaries
ON hof_inducted.playerid = salaries.playerid;


--4.
SELECT * FROM hof_inducted
UNION ALL
SELECT * FROM hof_not_inducted;

SELECT playerid FROM hof_inducted
UNION
SELECT playerid FROM hof_not_inducted;

--5.
SELECT
	namelast,
	namefirst,
	SUM(salary) AS total_salary
FROM salaries AS s
INNER JOIN people AS p
ON s.playerid = p.playerid
GROUP BY p.playerid, namelast, namefirst;


--6.
SELECT hof_inducted.playerid, yearid, namefirst, namelast 
FROM hof_inducted LEFT OUTER JOIN people
ON hof_inducted.playerid = people.playerid

UNION ALL 

SELECT hof_not_inducted.playerid, yearid, namefirst, namelast 
FROM hof_not_inducted LEFT OUTER JOIN people
ON hof_not_inducted.playerid = people.playerid;


--7.
SELECT concat(namelast,', ', namefirst) AS namefull, yearid, inducted
FROM hof_inducted LEFT OUTER JOIN people
ON hof_inducted.playerid = people.playerid
WHERE yearid >= 1980

UNION ALL 

SELECT concat(namelast,', ', namefirst) AS namefull, yearid, inducted
FROM hof_not_inducted LEFT OUTER JOIN people
ON hof_not_inducted.playerid = people.playerid
WHERE yearid >= 1980

ORDER BY yearid,  inducted DESC, namefull;

--8. 
WITH max AS
(SELECT MAX(salary) as max_salary, teamid, yearid
FROM salaries
GROUP BY teamid, yearid)
SELECT salaries.yearid, salaries.teamid, playerid, max.max_salary
FROM max LEFT OUTER JOIN salaries
ON salaries.teamid = max.teamid AND salaries.yearid = max.yearid AND salaries.salary = max.max_salary
ORDER BY max.max_salary DESC;


--9.
SELECT birthyear, deathyear, namefirst, namelast
FROM people
WHERE birthyear > ANY
	(SELECT	birthyear
	FROM people
	WHERE playerid = 'ruthba01')
ORDER BY birthyear;

-- 10.
SELECT namefirst, namelast, 
	CASE
		WHEN birthcountry = 'USA' THEN 'USA'
		ELSE 'non-USA'
	END AS usaborn
FROM people
ORDER BY 3;

-- 11
SELECT
AVG(CASE WHEN throws = 'R' THEN height END) AS right_height,
AVG(CASE WHEN throws = 'L' THEN height END) AS left_height
FROM people;

-- 12.
WITH max_sal_by_team_by_year AS
(
SELECT teamid, yearid, MAX(salary) AS max_sal
FROM salaries
GROUP BY teamid, yearid
)
SELECT teamid, AVG(max_sal) AS avg_max_sal_since_2010
FROM max_sal_by_team_by_year
WHERE yearid >= 2010
GROUP BY teamid;
