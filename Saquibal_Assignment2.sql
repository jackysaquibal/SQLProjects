/*
DTSC 660
Assignment 2
Name: Jacqueline Saquibal

Put your SQL code in the appropriate section of the document below
*/

--Question 1 (Put your answer below)
SELECT * FROM github;
--Question 2
SELECT DISTINCT topic FROM github;
--Question 3
SELECT repo_name, star_count FROM github 
ORDER BY star_count DESC;
--Question 4
SELECT DISTINCT topic FROM github
ORDER BY topic;
--Question 5
SELECT repo_name FROM github
WHERE star_count > 2000;
--Question 6
SELECT repo_name FROM github
WHERE star_count > 3000 
	AND topic = '3d';
--Question 7
SELECT repo_name FROM github
WHERE star_count < 1000
	AND (topic = 'azure' OR topic = 'aws' OR topic = 'chrome');
--Question 8
SELECT user_name, repo_name, repo_link FROM github
WHERE repo_link ILIKE '%ext%';
--Question 9
SELECT * FROM github
WHERE topic = 'chrome'
	AND star_count > 5000;
--Question 10
SELECT user_name, repo_name FROM github
WHERE star_count > 1000 AND star_count < 15000;
--Question 11
SELECT DISTINCT user_name FROM github
WHERE star_count > 15000
ORDER BY user_name;
--Question 12
SELECT DISTINCT user_name FROM github
WHERE user_name LIKE 'Add%'
	OR user_name LIKE '%on';
--Question 13
SELECT DISTINCT topic FROM github
WHERE star_count > 100000
ORDER BY topic;
--Question 14
SELECT topic FROM github 
WHERE star_count ISNULL;
--Question 15
SELECT topic, user_name, star_count FROM github
WHERE star_count BETWEEN 100000 AND 200000
	AND topic LIKE 'a%';
