
-- 1 Check if the data has 268 records.
-- Count the Number of records in the data--

select COUNT(*) AS total_records
FROM student_mental_helath.`students.csv`;

-- 2 Inspect the dataset to see what the fields look like.
-- Inspect the data and Limit the Output to 5 records.

SELECT * FROM student_mental_helath.`students.csv`
limit 5;

-- 3 How many international and domestic students are in the data set?
-- Count the Number of Inernational and Domenstic Student.

SELECT inter_dom, COUNT(inter_dom) AS total_records
FROM student_mental_helath.`students.csv`
group by inter_dom ;

-- 4 Where are the international students from? 
-- Find out the total records of all international students by region.

SELECT region, COUNT(*) AS region_count
FROM student_mental_helath.`students.csv`
WHERE inter_dom = 'Inter'
GROUP BY region
ORDER BY region_count DESC;

Select *FROM student_mental_helath.`students.csv`
where inter_dom='Inter' AND region='JAP';

-- 5 Find the minimum, maximum, and average of each of the diagnostic tests (PHQ-9, SCS, ASISS).
-- This information is in the paper, but it's good practice to look this up yourself during analysis.
-- Find out the basic summary statistics for all test score (Depresion Test, Social
-- Connectedness Test and Acculturative Stress Test) 

select 
	MIN(todep) AS min_phq,
	MAX(todep) AS max_phq,
	ROUND(AVG(todep),2) AS avg_phq,
	MIN(tosc) AS min_scs,
	MAX(tosc) AS max_scs,
	ROUND(AVG(tosc),2) AS avg_scs,
	MIN(toas) AS min_as,
	MAX(toas) AS max_as,
	ROUND(AVG(toas),2) AS avg_as
     FROM student_mental_helath.`students.csv`;

-- 6 What are the summary statistics for domestic students and international students?
--  Summarize the statistics score from International Students and Domestic Students --

SELECT 
	MIN(todep) AS min_phq,
	MAX(todep) AS max_phq,
	ROUND(AVG(todep),2) AS avg_phq,
	MIN(tosc) AS min_scs,
	MAX(tosc) AS max_scs,
	ROUND(AVG(tosc),2) AS avg_scs,
	MIN(toas) AS min_as,
	MAX(toas) AS max_as,
	ROUND(AVG(toas),2) AS avg_as
FROM student_mental_helath.`students.csv`
group by inter_dom;

	-- How does the age of the international student impact the scores?
    -- Find outs all average test scores for International Students group and ordered by age.
    
    SELECT Age,
	ROUND(AVG(todep),2) AS avg_phq,
    ROUND(AVG(tosc),2) AS avg_scs,
    ROUND(AVG(toas),2) AS avg_asiss
FROM student_mental_helath.`students.csv`
where inter_dom='inter'
group by age
order by age;

-- See how another variable may impact the score.
-- Find outs all average test scores for International Students group and ordered by gender.

SELECT gender,
	ROUND(AVG(todep),2) AS avg_phq,
    ROUND(AVG(tosc),2) AS avg_scs,
    ROUND(AVG(toas),2) AS avg_asiss
FROM student_mental_helath.`students.csv`
where inter_dom='inter'
group by gender
order by gender;

-- See the impact of the length of stay
-- Find out how length of stay factor affects the score of all test (average and rounded by 2 decimal) --

SELECT stay,
		COUNT(*) AS count_int,
		ROUND(AVG(todep), 2) AS average_phq,
		ROUND(AVG(tosc), 2) AS average_scs,
		ROUND(AVG(toas), 2) AS average_as
FROM student_mental_helath.`students.csv`        
WHERE inter_dom = 'Inter'
GROUP BY stay
ORDER BY stay DESC;

