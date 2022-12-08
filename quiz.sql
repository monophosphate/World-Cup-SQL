/*
Question solutions are provided at the bottom of the instructions tab. 
Warm up by reviewing your SQL skills!
https://coderpad.io/blog/development/sql-functions-and-techniques-every-data-person-should-know/
https://coderpad.io/blog/development/window-functions-aggregate-data-postgres/
*/


/*
Question 1: Which FIFA World Cup (year and host country) had the most goals scored (and how many)? 
Hint: The top spot is a tie between two cups in the last 30 years.
Level: Beginner 
Skills Needed: ORDER BY
Relevant Data
  Table: world_cup_tournaments
  Fields: Year, Host_Country, Goals_Scored
*/


SELECT 
  Year, 
  Host_Country, 
  Goals_Scored
FROM world_cup_tournaments
ORDER BY Goals_Scored DESC


/*
Question 2: Which FIFA World Cup Year and Host Country had the most pitch locations? (i.e. had the most stadiums)
Hint: This was the only world cup hosted by 2 countries!
Level: Intermediate 
Skills Needed: LEFT JOIN, COUNT(), GROUP BY, ORDER BY
Relevant 
  Tables: world_cup_tournaments, world_cup_matches
  Fields: Year, Host_Country, Stadium
*/

-- SELECT * FROM world_cup_matches \G


SELECT 
  wcs.Year,
  wcs.Host_Country,
  COUNT(DISTINCT matches.Stadium) AS stadium_count
FROM world_cup_tournaments AS wcs
LEFT JOIN world_cup_matches AS matches
ON wcs.Year = matches.Year
GROUP BY 1, 2
ORDER BY 3 DESC


/*
Question 3: Which FIFA World Cup Year was the most exciting (i.e. had the highest average goals scored per match)? Use CTE to answer.
Hint: The lowest was Italy 1990 with an average near 2.2 goals per match.
Level: Advanced 
Skills Needed: Common Table Expressions (CTE), ORDER BY
Relevant 
  Tables: world_cup_tournaments
  Fields: Year, Host_Country, Goals_Scored, Matches_Played
*/





/*
Question 4: List the top 10 most popular teams in FIFA World Cup history! (i.e. with the largest total stadium attendance) 
Hints 
  1: you will need two copies of world_cup_matches (one for the home team and one for the away team) 
  2: combine the two copies using UNION ALL
  3: the most popular team had more than 5.6 million spectators in total!
Level: Legendary 
Skills Needed: Common Table Expressions (CTE), UNION ALL, ORDER BY, SUM(), LIMIT
Relevant 
  Table: world_cup_matches 
  Fields: Match_ID, Home_Team_Name, Away_Team_Name, Attendance 

*/




