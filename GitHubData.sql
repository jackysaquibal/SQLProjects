/*
Name: Jacqueline Saquibal
Database Mangement With SQL
*/

-- Queried all data from the github table.
SELECT * FROM github;

-- Queried a list of all topics from the data, excluding duplicates.
SELECT DISTINCT topic FROM github;

-- Queried a list of the repo name along with the star_count from largest to smallest.
SELECT repo_name, star_count FROM github 
ORDER BY star_count DESC;

-- Queried a list of topics in alphabetical order, excluding duplicates. 
SELECT DISTINCT topic FROM github
ORDER BY topic;

-- Queried a list of repo with a star count greater than 2000. 
SELECT repo_name FROM github
WHERE star_count > 2000;

-- Queried a list of all repo names that have a star count greater than 3000 and are in the 3d topic.
SELECT repo_name FROM github
WHERE star_count > 3000 
	AND topic = '3d';

-- Queried a list of repo names with a star count of less than 1000 that are in the azure, aws, or chrome topic.
SELECT repo_name FROM github
WHERE star_count < 1000
	AND (topic = 'azure' OR topic = 'aws' OR topic = 'chrome');

-- Queried a list of the user name, repo name, and repo link in which the repo link contains "ext". 
SELECT user_name, repo_name, repo_link FROM github
WHERE repo_link ILIKE '%ext%';

-- Queried all columns in the chrome topic with a star count of greater than 5000.
SELECT * FROM github
WHERE topic = 'chrome'
	AND star_count > 5000;

-- Queried a list of user names and repo names with a star count range between 1000 and 15000.
SELECT user_name, repo_name FROM github
WHERE star_count > 1000 AND star_count < 15000;

-- Queried a list of unique user names with a star count greater than 15000 and sorted alphabetically.
SELECT DISTINCT user_name FROM github
WHERE star_count > 15000
ORDER BY user_name;

-- Queried a list of unique user names that start wit 'Add' or end with 'on'.
SELECT DISTINCT user_name FROM github
WHERE user_name LIKE 'Add%'
	OR user_name LIKE '%on';

-- Queried a list of unique topics and ordered alphabetically with a star count greater than 100000.
SELECT DISTINCT topic FROM github
WHERE star_count > 100000
ORDER BY topic;

-- Queried a list of topics with a null star count.
SELECT topic FROM github 
WHERE star_count ISNULL;

-- Queried a list of topics, user names, and star counts with a star count between 100000 and 200000, and whose topic starts with 'a'.
SELECT topic, user_name, star_count FROM github
WHERE star_count BETWEEN 100000 AND 200000
	AND topic LIKE 'a%';
